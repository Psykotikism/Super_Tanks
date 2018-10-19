// Super Tanks++: Quiet Ability
#include <sourcemod>
#include <sdkhooks>
#include <sdktools>

#undef REQUIRE_PLUGIN
#include <st_clone>
#define REQUIRE_PLUGIN

#include <super_tanks++>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo =
{
	name = "[ST++] Quiet Ability",
	author = ST_AUTHOR,
	description = "The Super Tank silences itself around survivors.",
	version = ST_VERSION,
	url = ST_URL
};

bool g_bCloneInstalled, g_bLateLoad, g_bQuiet[MAXPLAYERS + 1], g_bTankConfig[ST_MAXTYPES + 1];

char g_sQuietEffect[ST_MAXTYPES + 1][4], g_sQuietEffect2[ST_MAXTYPES + 1][4];

float g_flQuietChance[ST_MAXTYPES + 1], g_flQuietChance2[ST_MAXTYPES + 1], g_flQuietDuration[ST_MAXTYPES + 1], g_flQuietDuration2[ST_MAXTYPES + 1], g_flQuietRange[ST_MAXTYPES + 1], g_flQuietRange2[ST_MAXTYPES + 1], g_flQuietRangeChance[ST_MAXTYPES + 1], g_flQuietRangeChance2[ST_MAXTYPES + 1];

int g_iQuietAbility[ST_MAXTYPES + 1], g_iQuietAbility2[ST_MAXTYPES + 1], g_iQuietHit[ST_MAXTYPES + 1], g_iQuietHit2[ST_MAXTYPES + 1], g_iQuietHitMode[ST_MAXTYPES + 1], g_iQuietHitMode2[ST_MAXTYPES + 1], g_iQuietMessage[ST_MAXTYPES + 1], g_iQuietMessage2[ST_MAXTYPES + 1];

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
	if (!bIsValidGame(false) && !bIsValidGame())
	{
		strcopy(error, err_max, "[ST++] Quiet Ability only supports Left 4 Dead 1 & 2.");

		return APLRes_SilentFailure;
	}

	g_bLateLoad = late;

	return APLRes_Success;
}

public void OnAllPluginsLoaded()
{
	g_bCloneInstalled = LibraryExists("st_clone");
}

public void OnLibraryAdded(const char[] name)
{
	if (StrEqual(name, "st_clone", false))
	{
		g_bCloneInstalled = true;
	}
}

public void OnLibraryRemoved(const char[] name)
{
	if (StrEqual(name, "st_clone", false))
	{
		g_bCloneInstalled = false;
	}
}

public void OnPluginStart()
{
	LoadTranslations("super_tanks++.phrases");

	if (g_bLateLoad)
	{
		for (int iPlayer = 1; iPlayer <= MaxClients; iPlayer++)
		{
			if (bIsValidClient(iPlayer))
			{
				OnClientPutInServer(iPlayer);
			}
		}

		g_bLateLoad = false;
	}
}

public void OnMapStart()
{
	vReset();

	AddNormalSoundHook(SoundHook);
}

public void OnClientPutInServer(int client)
{
	SDKHook(client, SDKHook_OnTakeDamage, OnTakeDamage);

	g_bQuiet[client] = false;
}

public void OnMapEnd()
{
	vReset();

	RemoveNormalSoundHook(SoundHook);
}

public Action OnTakeDamage(int victim, int &attacker, int &inflictor, float &damage, int &damagetype)
{
	if (ST_PluginEnabled() && damage > 0.0)
	{
		char sClassname[32];
		GetEntityClassname(inflictor, sClassname, sizeof(sClassname));

		if ((iQuietHitMode(attacker) == 0 || iQuietHitMode(attacker) == 1) && ST_TankAllowed(attacker) && ST_CloneAllowed(attacker, g_bCloneInstalled) && IsPlayerAlive(attacker) && bIsHumanSurvivor(victim))
		{
			if (StrEqual(sClassname, "weapon_tank_claw") || StrEqual(sClassname, "tank_rock"))
			{
				vQuietHit(victim, attacker, flQuietChance(attacker), iQuietHit(attacker), 1, "1");
			}
		}
		else if ((iQuietHitMode(victim) == 0 || iQuietHitMode(victim) == 2) && ST_TankAllowed(victim) && ST_CloneAllowed(victim, g_bCloneInstalled) && IsPlayerAlive(victim) && bIsHumanSurvivor(attacker))
		{
			if (StrEqual(sClassname, "weapon_melee"))
			{
				vQuietHit(attacker, victim, flQuietChance(victim), iQuietHit(victim), 1, "2");
			}
		}
	}
}

public Action SoundHook(int clients[MAXPLAYERS], int &numClients, char sample[PLATFORM_MAX_PATH], int &entity, int &channel, float &volume, int &level, int &pitch, int &flags, char soundEntry[PLATFORM_MAX_PATH], int &seed)
{
	if (StrContains(sample, "player/tank", false) != -1)
	{
		for (int iSurvivor = 0; iSurvivor < numClients; iSurvivor++)
		{
			if (bIsHumanSurvivor(clients[iSurvivor]) && g_bQuiet[clients[iSurvivor]])
			{
				for (int iPlayers = iSurvivor; iPlayers < numClients - 1; iPlayers++)
				{
					clients[iPlayers] = clients[iPlayers + 1];
				}

				numClients--;
				iSurvivor--;
			}
		}

		return (numClients > 0) ? Plugin_Changed : Plugin_Stop;
	}

	return Plugin_Continue;
}

public void ST_Configs(const char[] savepath, bool main)
{
	KeyValues kvSuperTanks = new KeyValues("Super Tanks++");
	kvSuperTanks.ImportFromFile(savepath);
	for (int iIndex = ST_MinType(); iIndex <= ST_MaxType(); iIndex++)
	{
		char sTankName[MAX_NAME_LENGTH + 1];
		Format(sTankName, sizeof(sTankName), "Tank #%d", iIndex);
		if (kvSuperTanks.JumpToKey(sTankName, true))
		{
			if (main)
			{
				g_bTankConfig[iIndex] = false;

				g_iQuietAbility[iIndex] = kvSuperTanks.GetNum("Quiet Ability/Ability Enabled", 0);
				g_iQuietAbility[iIndex] = iClamp(g_iQuietAbility[iIndex], 0, 1);
				kvSuperTanks.GetString("Quiet Ability/Ability Effect", g_sQuietEffect[iIndex], sizeof(g_sQuietEffect[]), "123");
				g_iQuietMessage[iIndex] = kvSuperTanks.GetNum("Quiet Ability/Ability Message", 0);
				g_iQuietMessage[iIndex] = iClamp(g_iQuietMessage[iIndex], 0, 3);
				g_flQuietChance[iIndex] = kvSuperTanks.GetFloat("Quiet Ability/Quiet Chance", 33.3);
				g_flQuietChance[iIndex] = flClamp(g_flQuietChance[iIndex], 0.1, 100.0);
				g_flQuietDuration[iIndex] = kvSuperTanks.GetFloat("Quiet Ability/Quiet Duration", 5.0);
				g_flQuietDuration[iIndex] = flClamp(g_flQuietDuration[iIndex], 0.1, 9999999999.0);
				g_iQuietHit[iIndex] = kvSuperTanks.GetNum("Quiet Ability/Quiet Hit", 0);
				g_iQuietHit[iIndex] = iClamp(g_iQuietHit[iIndex], 0, 1);
				g_iQuietHitMode[iIndex] = kvSuperTanks.GetNum("Quiet Ability/Quiet Hit Mode", 0);
				g_iQuietHitMode[iIndex] = iClamp(g_iQuietHitMode[iIndex], 0, 2);
				g_flQuietRange[iIndex] = kvSuperTanks.GetFloat("Quiet Ability/Quiet Range", 150.0);
				g_flQuietRange[iIndex] = flClamp(g_flQuietRange[iIndex], 1.0, 9999999999.0);
				g_flQuietRangeChance[iIndex] = kvSuperTanks.GetFloat("Quiet Ability/Quiet Range Chance", 15.0);
				g_flQuietRangeChance[iIndex] = flClamp(g_flQuietRangeChance[iIndex], 0.1, 100.0);
			}
			else
			{
				g_bTankConfig[iIndex] = true;

				g_iQuietAbility2[iIndex] = kvSuperTanks.GetNum("Quiet Ability/Ability Enabled", g_iQuietAbility[iIndex]);
				g_iQuietAbility2[iIndex] = iClamp(g_iQuietAbility2[iIndex], 0, 1);
				kvSuperTanks.GetString("Quiet Ability/Ability Effect", g_sQuietEffect2[iIndex], sizeof(g_sQuietEffect2[]), g_sQuietEffect[iIndex]);
				g_iQuietMessage2[iIndex] = kvSuperTanks.GetNum("Quiet Ability/Ability Message", g_iQuietMessage[iIndex]);
				g_iQuietMessage2[iIndex] = iClamp(g_iQuietMessage2[iIndex], 0, 3);
				g_flQuietChance2[iIndex] = kvSuperTanks.GetFloat("Quiet Ability/Quiet Chance", g_flQuietChance[iIndex]);
				g_flQuietChance2[iIndex] = flClamp(g_flQuietChance2[iIndex], 0.1, 100.0);
				g_flQuietDuration2[iIndex] = kvSuperTanks.GetFloat("Quiet Ability/Quiet Duration", g_flQuietDuration[iIndex]);
				g_flQuietDuration2[iIndex] = flClamp(g_flQuietDuration2[iIndex], 0.1, 9999999999.0);
				g_iQuietHit2[iIndex] = kvSuperTanks.GetNum("Quiet Ability/Quiet Hit", g_iQuietHit[iIndex]);
				g_iQuietHit2[iIndex] = iClamp(g_iQuietHit2[iIndex], 0, 1);
				g_iQuietHitMode2[iIndex] = kvSuperTanks.GetNum("Quiet Ability/Quiet Hit Mode", g_iQuietHitMode[iIndex]);
				g_iQuietHitMode2[iIndex] = iClamp(g_iQuietHitMode2[iIndex], 0, 2);
				g_flQuietRange2[iIndex] = kvSuperTanks.GetFloat("Quiet Ability/Quiet Range", g_flQuietRange[iIndex]);
				g_flQuietRange2[iIndex] = flClamp(g_flQuietRange2[iIndex], 1.0, 9999999999.0);
				g_flQuietRangeChance2[iIndex] = kvSuperTanks.GetFloat("Quiet Ability/Quiet Range Chance", g_flQuietRangeChance[iIndex]);
				g_flQuietRangeChance2[iIndex] = flClamp(g_flQuietRangeChance2[iIndex], 0.1, 100.0);
			}

			kvSuperTanks.Rewind();
		}
	}

	delete kvSuperTanks;
}

public void ST_PluginEnd()
{
	vRemoveQuiet();
	vReset();
}

public void ST_Event(Event event, const char[] name)
{
	if (StrEqual(name, "player_death"))
	{
		int iTankId = event.GetInt("userid"), iTank = GetClientOfUserId(iTankId);
		if (ST_TankAllowed(iTank) && ST_CloneAllowed(iTank, g_bCloneInstalled))
		{
			vRemoveQuiet();
		}
	}
}

public void ST_Ability(int tank)
{
	if (ST_TankAllowed(tank) && ST_CloneAllowed(tank, g_bCloneInstalled) && IsPlayerAlive(tank))
	{
		float flQuietRange = !g_bTankConfig[ST_TankType(tank)] ? g_flQuietRange[ST_TankType(tank)] : g_flQuietRange2[ST_TankType(tank)],
			flQuietRangeChance = !g_bTankConfig[ST_TankType(tank)] ? g_flQuietRangeChance[ST_TankType(tank)] : g_flQuietRangeChance2[ST_TankType(tank)],
			flTankPos[3];

		GetClientAbsOrigin(tank, flTankPos);

		for (int iSurvivor = 1; iSurvivor <= MaxClients; iSurvivor++)
		{
			if (bIsHumanSurvivor(iSurvivor))
			{
				float flSurvivorPos[3];
				GetClientAbsOrigin(iSurvivor, flSurvivorPos);

				float flDistance = GetVectorDistance(flTankPos, flSurvivorPos);
				if (flDistance <= flQuietRange)
				{
					vQuietHit(iSurvivor, tank, flQuietRangeChance, iQuietAbility(tank), 2, "3");
				}
			}
		}
	}
}

public void ST_BossStage(int tank)
{
	if (iQuietAbility(tank) == 1 && ST_TankAllowed(tank) && ST_CloneAllowed(tank, g_bCloneInstalled))
	{
		vRemoveQuiet();
	}
}

static void vQuietHit(int survivor, int tank, float chance, int enabled, int message, const char[] mode)
{
	if (enabled == 1 && GetRandomFloat(0.1, 100.0) <= chance && bIsHumanSurvivor(survivor) && !g_bQuiet[survivor])
	{
		g_bQuiet[survivor] = true;

		float flQuietDuration = !g_bTankConfig[ST_TankType(tank)] ? g_flQuietDuration[ST_TankType(tank)] : g_flQuietDuration2[ST_TankType(tank)];
		DataPack dpStopQuiet;
		CreateDataTimer(flQuietDuration, tTimerStopQuiet, dpStopQuiet, TIMER_FLAG_NO_MAPCHANGE);
		dpStopQuiet.WriteCell(GetClientUserId(survivor));
		dpStopQuiet.WriteCell(GetClientUserId(tank));
		dpStopQuiet.WriteCell(message);

		char sQuietEffect[4];
		sQuietEffect = !g_bTankConfig[ST_TankType(tank)] ? g_sQuietEffect[ST_TankType(tank)] : g_sQuietEffect2[ST_TankType(tank)];
		vEffect(survivor, tank, sQuietEffect, mode);

		if (iQuietMessage(tank) == message || iQuietMessage(tank) == 3)
		{
			char sTankName[MAX_NAME_LENGTH + 1];
			ST_TankName(tank, sTankName);
			PrintToChatAll("%s %t", ST_TAG2, "Quiet", sTankName, survivor);
		}
	}
}

static void vRemoveQuiet()
{
	for (int iSurvivor = 1; iSurvivor <= MaxClients; iSurvivor++)
	{
		if (bIsHumanSurvivor(iSurvivor) && g_bQuiet[iSurvivor])
		{
			g_bQuiet[iSurvivor] = false;
		}
	}
}

static void vReset()
{
	for (int iPlayer = 1; iPlayer <= MaxClients; iPlayer++)
	{
		if (bIsValidClient(iPlayer))
		{
			g_bQuiet[iPlayer] = false;
		}
	}
}

static float flQuietChance(int tank)
{
	return !g_bTankConfig[ST_TankType(tank)] ? g_flQuietChance[ST_TankType(tank)] : g_flQuietChance2[ST_TankType(tank)];
}

static int iQuietAbility(int tank)
{
	return !g_bTankConfig[ST_TankType(tank)] ? g_iQuietAbility[ST_TankType(tank)] : g_iQuietAbility2[ST_TankType(tank)];
}

static int iQuietHit(int tank)
{
	return !g_bTankConfig[ST_TankType(tank)] ? g_iQuietHit[ST_TankType(tank)] : g_iQuietHit2[ST_TankType(tank)];
}

static int iQuietHitMode(int tank)
{
	return !g_bTankConfig[ST_TankType(tank)] ? g_iQuietHitMode[ST_TankType(tank)] : g_iQuietHitMode2[ST_TankType(tank)];
}

static int iQuietMessage(int tank)
{
	return !g_bTankConfig[ST_TankType(tank)] ? g_iQuietMessage[ST_TankType(tank)] : g_iQuietMessage2[ST_TankType(tank)];
}

public Action tTimerStopQuiet(Handle timer, DataPack pack)
{
	pack.Reset();

	int iSurvivor = GetClientOfUserId(pack.ReadCell());
	if (!bIsHumanSurvivor(iSurvivor) || !g_bQuiet[iSurvivor])
	{
		g_bQuiet[iSurvivor] = false;

		return Plugin_Stop;
	}

	int iTank = GetClientOfUserId(pack.ReadCell()), iQuietChat = pack.ReadCell();
	if (!ST_TankAllowed(iTank) || !IsPlayerAlive(iTank) || !ST_CloneAllowed(iTank, g_bCloneInstalled))
	{
		g_bQuiet[iSurvivor] = false;

		return Plugin_Stop;
	}

	g_bQuiet[iSurvivor] = false;

	if (iQuietMessage(iTank) == iQuietChat || iQuietMessage(iTank) == 3)
	{
		char sTankName[MAX_NAME_LENGTH + 1];
		ST_TankName(iTank, sTankName);
		PrintToChatAll("%s %t", ST_TAG2, "Quiet2", sTankName, iSurvivor);
	}

	return Plugin_Continue;
}