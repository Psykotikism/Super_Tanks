// Super Tanks++: Aimless Ability
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
	name = "[ST++] Aimless Ability",
	author = ST_AUTHOR,
	description = "The Super Tank prevents survivors from aiming.",
	version = ST_VERSION,
	url = ST_URL
};

bool g_bCloneInstalled, g_bAimless[MAXPLAYERS + 1], g_bLateLoad, g_bTankConfig[ST_MAXTYPES + 1];

char g_sAimlessEffect[ST_MAXTYPES + 1][4], g_sAimlessEffect2[ST_MAXTYPES + 1][4];

float g_flAimlessAngle[MAXPLAYERS + 1][3], g_flAimlessChance[ST_MAXTYPES + 1], g_flAimlessChance2[ST_MAXTYPES + 1], g_flAimlessDuration[ST_MAXTYPES + 1], g_flAimlessDuration2[ST_MAXTYPES + 1], g_flAimlessRange[ST_MAXTYPES + 1], g_flAimlessRange2[ST_MAXTYPES + 1], g_flAimlessRangeChance[ST_MAXTYPES + 1], g_flAimlessRangeChance2[ST_MAXTYPES + 1];

int g_iAimlessAbility[ST_MAXTYPES + 1], g_iAimlessAbility2[ST_MAXTYPES + 1], g_iAimlessHit[ST_MAXTYPES + 1], g_iAimlessHit2[ST_MAXTYPES + 1], g_iAimlessHitMode[ST_MAXTYPES + 1], g_iAimlessHitMode2[ST_MAXTYPES + 1], g_iAimlessMessage[ST_MAXTYPES + 1], g_iAimlessMessage2[ST_MAXTYPES + 1];

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
	if (!bIsValidGame(false) && !bIsValidGame())
	{
		strcopy(error, err_max, "[ST++] Aimless Ability only supports Left 4 Dead 1 & 2.");

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
}

public void OnClientPutInServer(int client)
{
	SDKHook(client, SDKHook_OnTakeDamage, OnTakeDamage);

	g_bAimless[client] = false;
}

public void OnMapEnd()
{
	vReset();
}

public Action OnPlayerRunCmd(int client, int &buttons, int &impulse, float vel[3], float angles[3], int &weapon)
{
	if (!ST_PluginEnabled())
	{
		return Plugin_Continue;
	}

	if (g_bAimless[client])
	{
		TeleportEntity(client, NULL_VECTOR, g_flAimlessAngle[client], NULL_VECTOR);
	}

	return Plugin_Continue;
}

public Action OnTakeDamage(int victim, int &attacker, int &inflictor, float &damage, int &damagetype)
{
	if (ST_PluginEnabled() && damage > 0.0)
	{
		char sClassname[32];
		GetEntityClassname(inflictor, sClassname, sizeof(sClassname));

		if ((iAimlessHitMode(attacker) == 0 || iAimlessHitMode(attacker) == 1) && ST_TankAllowed(attacker) && ST_CloneAllowed(attacker, g_bCloneInstalled) && IsPlayerAlive(attacker) && bIsSurvivor(victim))
		{
			if (StrEqual(sClassname, "weapon_tank_claw") || StrEqual(sClassname, "tank_rock"))
			{
				vAimlessHit(victim, attacker, flAimlessChance(attacker), iAimlessHit(attacker), 1, "1");
			}
		}
		else if ((iAimlessHitMode(victim) == 0 || iAimlessHitMode(victim) == 2) && ST_TankAllowed(victim) && ST_CloneAllowed(victim, g_bCloneInstalled) && IsPlayerAlive(victim) && bIsSurvivor(attacker))
		{
			if (StrEqual(sClassname, "weapon_melee"))
			{
				vAimlessHit(attacker, victim, flAimlessChance(victim), iAimlessHit(victim), 1, "2");
			}
		}
	}
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

				g_iAimlessAbility[iIndex] = kvSuperTanks.GetNum("Aimless Ability/Ability Enabled", 0);
				g_iAimlessAbility[iIndex] = iClamp(g_iAimlessAbility[iIndex], 0, 1);
				kvSuperTanks.GetString("Aimless Ability/Ability Effect", g_sAimlessEffect[iIndex], sizeof(g_sAimlessEffect[]), "123");
				g_iAimlessMessage[iIndex] = kvSuperTanks.GetNum("Aimless Ability/Ability Message", 0);
				g_iAimlessMessage[iIndex] = iClamp(g_iAimlessMessage[iIndex], 0, 3);
				g_flAimlessChance[iIndex] = kvSuperTanks.GetFloat("Aimless Ability/Aimless Chance", 33.3);
				g_flAimlessChance[iIndex] = flClamp(g_flAimlessChance[iIndex], 0.1, 100.0);
				g_flAimlessDuration[iIndex] = kvSuperTanks.GetFloat("Aimless Ability/Aimless Duration", 5.0);
				g_flAimlessDuration[iIndex] = flClamp(g_flAimlessDuration[iIndex], 0.1, 9999999999.0);
				g_iAimlessHit[iIndex] = kvSuperTanks.GetNum("Aimless Ability/Aimless Hit", 0);
				g_iAimlessHit[iIndex] = iClamp(g_iAimlessHit[iIndex], 0, 1);
				g_iAimlessHitMode[iIndex] = kvSuperTanks.GetNum("Aimless Ability/Aimless Hit Mode", 0);
				g_iAimlessHitMode[iIndex] = iClamp(g_iAimlessHitMode[iIndex], 0, 2);
				g_flAimlessRange[iIndex] = kvSuperTanks.GetFloat("Aimless Ability/Aimless Range", 150.0);
				g_flAimlessRange[iIndex] = flClamp(g_flAimlessRange[iIndex], 1.0, 9999999999.0);
				g_flAimlessRangeChance[iIndex] = kvSuperTanks.GetFloat("Aimless Ability/Aimless Range Chance", 15.0);
				g_flAimlessRangeChance[iIndex] = flClamp(g_flAimlessRangeChance[iIndex], 0.1, 100.0);
			}
			else
			{
				g_bTankConfig[iIndex] = true;

				g_iAimlessAbility2[iIndex] = kvSuperTanks.GetNum("Aimless Ability/Ability Enabled", g_iAimlessAbility[iIndex]);
				g_iAimlessAbility2[iIndex] = iClamp(g_iAimlessAbility2[iIndex], 0, 1);
				kvSuperTanks.GetString("Aimless Ability/Ability Effect", g_sAimlessEffect2[iIndex], sizeof(g_sAimlessEffect2[]), g_sAimlessEffect[iIndex]);
				g_iAimlessMessage2[iIndex] = kvSuperTanks.GetNum("Aimless Ability/Ability Message", g_iAimlessMessage[iIndex]);
				g_iAimlessMessage2[iIndex] = iClamp(g_iAimlessMessage2[iIndex], 0, 3);
				g_flAimlessChance2[iIndex] = kvSuperTanks.GetFloat("Aimless Ability/Aimless Chance", g_flAimlessChance[iIndex]);
				g_flAimlessChance2[iIndex] = flClamp(g_flAimlessChance2[iIndex], 0.1, 100.0);
				g_flAimlessDuration2[iIndex] = kvSuperTanks.GetFloat("Aimless Ability/Aimless Duration", g_flAimlessDuration[iIndex]);
				g_flAimlessDuration2[iIndex] = flClamp(g_flAimlessDuration2[iIndex], 0.1, 9999999999.0);
				g_iAimlessHit2[iIndex] = kvSuperTanks.GetNum("Aimless Ability/Aimless Hit", g_iAimlessHit[iIndex]);
				g_iAimlessHit2[iIndex] = iClamp(g_iAimlessHit2[iIndex], 0, 1);
				g_iAimlessHitMode2[iIndex] = kvSuperTanks.GetNum("Aimless Ability/Aimless Hit Mode", g_iAimlessHitMode[iIndex]);
				g_iAimlessHitMode2[iIndex] = iClamp(g_iAimlessHitMode2[iIndex], 0, 2);
				g_flAimlessRange2[iIndex] = kvSuperTanks.GetFloat("Aimless Ability/Aimless Range", g_flAimlessRange[iIndex]);
				g_flAimlessRange2[iIndex] = flClamp(g_flAimlessRange2[iIndex], 1.0, 9999999999.0);
				g_flAimlessRangeChance2[iIndex] = kvSuperTanks.GetFloat("Aimless Ability/Aimless Range Chance", g_flAimlessRangeChance[iIndex]);
				g_flAimlessRangeChance2[iIndex] = flClamp(g_flAimlessRangeChance2[iIndex], 0.1, 100.0);
			}

			kvSuperTanks.Rewind();
		}
	}

	delete kvSuperTanks;
}

public void ST_PluginEnd()
{
	vRemoveAimless();
	vReset();
}

public void ST_Event(Event event, const char[] name)
{
	if (StrEqual(name, "player_death"))
	{
		int iTankId = event.GetInt("userid"), iTank = GetClientOfUserId(iTankId);
		if (ST_TankAllowed(iTank) && ST_CloneAllowed(iTank, g_bCloneInstalled))
		{
			vRemoveAimless();
		}
	}
}

public void ST_Ability(int tank)
{
	if (ST_TankAllowed(tank) && ST_CloneAllowed(tank, g_bCloneInstalled) && IsPlayerAlive(tank))
	{
		float flAimlessRange = !g_bTankConfig[ST_TankType(tank)] ? g_flAimlessRange[ST_TankType(tank)] : g_flAimlessRange2[ST_TankType(tank)],
			flAimlessRangeChance = !g_bTankConfig[ST_TankType(tank)] ? g_flAimlessRangeChance[ST_TankType(tank)] : g_flAimlessRangeChance2[ST_TankType(tank)],
			flTankPos[3];

		GetClientAbsOrigin(tank, flTankPos);

		for (int iSurvivor = 1; iSurvivor <= MaxClients; iSurvivor++)
		{
			if (bIsSurvivor(iSurvivor))
			{
				float flSurvivorPos[3];
				GetClientAbsOrigin(iSurvivor, flSurvivorPos);

				float flDistance = GetVectorDistance(flTankPos, flSurvivorPos);
				if (flDistance <= flAimlessRange)
				{
					vAimlessHit(iSurvivor, tank, flAimlessRangeChance, iAimlessAbility(tank), 2, "3");
				}
			}
		}
	}
}

public void ST_BossStage(int tank)
{
	if (iAimlessAbility(tank) == 1 && ST_TankAllowed(tank) && ST_CloneAllowed(tank, g_bCloneInstalled))
	{
		vRemoveAimless();
	}
}

static void vAimlessHit(int survivor, int tank, float chance, int enabled, int message, const char[] mode)
{
	if (enabled == 1 && GetRandomFloat(0.1, 100.0) <= chance && bIsSurvivor(survivor) && !g_bAimless[survivor])
	{
		g_bAimless[survivor] = true;

		GetClientEyeAngles(survivor, g_flAimlessAngle[survivor]);

		float flAimlessDuration = !g_bTankConfig[ST_TankType(tank)] ? g_flAimlessDuration[ST_TankType(tank)] : g_flAimlessDuration2[ST_TankType(tank)];
		DataPack dpStopAimless;
		CreateDataTimer(flAimlessDuration, tTimerStopAimless, dpStopAimless, TIMER_FLAG_NO_MAPCHANGE);
		dpStopAimless.WriteCell(GetClientUserId(survivor));
		dpStopAimless.WriteCell(GetClientUserId(tank));
		dpStopAimless.WriteCell(message);

		char sAimlessEffect[4];
		sAimlessEffect = !g_bTankConfig[ST_TankType(tank)] ? g_sAimlessEffect[ST_TankType(tank)] : g_sAimlessEffect2[ST_TankType(tank)];
		vEffect(survivor, tank, sAimlessEffect, mode);

		if (iAimlessMessage(tank) == message || iAimlessMessage(tank) == 3)
		{
			char sTankName[MAX_NAME_LENGTH + 1];
			ST_TankName(tank, sTankName);
			PrintToChatAll("%s %t", ST_TAG2, "Aimless", sTankName, survivor);
		}
	}
}

static void vRemoveAimless()
{
	for (int iSurvivor = 1; iSurvivor <= MaxClients; iSurvivor++)
	{
		if (bIsSurvivor(iSurvivor) && g_bAimless[iSurvivor])
		{
			g_bAimless[iSurvivor] = false;
		}
	}
}

static void vReset()
{
	for (int iPlayer = 1; iPlayer <= MaxClients; iPlayer++)
	{
		if (bIsValidClient(iPlayer))
		{
			g_bAimless[iPlayer] = false;
		}
	}
}

static float flAimlessChance(int tank)
{
	return !g_bTankConfig[ST_TankType(tank)] ? g_flAimlessChance[ST_TankType(tank)] : g_flAimlessChance2[ST_TankType(tank)];
}

static int iAimlessAbility(int tank)
{
	return !g_bTankConfig[ST_TankType(tank)] ? g_iAimlessAbility[ST_TankType(tank)] : g_iAimlessAbility2[ST_TankType(tank)];
}

static int iAimlessHit(int tank)
{
	return !g_bTankConfig[ST_TankType(tank)] ? g_iAimlessHit[ST_TankType(tank)] : g_iAimlessHit2[ST_TankType(tank)];
}

static int iAimlessHitMode(int tank)
{
	return !g_bTankConfig[ST_TankType(tank)] ? g_iAimlessHitMode[ST_TankType(tank)] : g_iAimlessHitMode2[ST_TankType(tank)];
}

static int iAimlessMessage(int tank)
{
	return !g_bTankConfig[ST_TankType(tank)] ? g_iAimlessMessage[ST_TankType(tank)] : g_iAimlessMessage2[ST_TankType(tank)];
}

public Action tTimerStopAimless(Handle timer, DataPack pack)
{
	pack.Reset();

	int iSurvivor = GetClientOfUserId(pack.ReadCell());
	if (!bIsSurvivor(iSurvivor) || !g_bAimless[iSurvivor])
	{
		g_bAimless[iSurvivor] = false;

		return Plugin_Stop;
	}

	int iTank = GetClientOfUserId(pack.ReadCell()), iAimlessChat = pack.ReadCell();
	if (!ST_TankAllowed(iTank) || !IsPlayerAlive(iTank) || !ST_CloneAllowed(iTank, g_bCloneInstalled))
	{
		g_bAimless[iSurvivor] = false;

		return Plugin_Stop;
	}

	g_bAimless[iSurvivor] = false;

	if (iAimlessMessage(iTank) == iAimlessChat || iAimlessMessage(iTank) == 3)
	{
		PrintToChatAll("%s %t", ST_TAG2, "Aimless2", iSurvivor);
	}

	return Plugin_Continue;
}