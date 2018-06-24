# Super Tanks++
Originally created by Machine, Super Tanks++ takes the original Super Tanks to the next level by adding more than twice the amount of unique types of Super Tanks to make gameplay more interesting.

## License
Super Tanks++: a L4D/L4D2 SourceMod Plugin
Copyright (C) 2017  Alfred "Crasher_3637/Psyk0tik" Llagas

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

## About
Super Tanks++ makes fighting Tanks great again!

> Super Tanks++ will enhance and intensify Tank fights by making each Tank that spawns unique and different in its own way.

### What makes Super Tanks++ viable in Left 4 Dead/Left 4 Dead 2?
Super Tanks++ enhances the experience and fun that players get from Tank fights by 1000. This plugin gives server owners an arsenal of Super Tanks to test players' skills and create a unique experience in every Tank fight.

### Requirements
Super Tanks++ was developed against SourceMod 1.8+.

### Installation
1. Delete files from old versions of the plugin.
2. Extract the folder inside the .zip file.
3. Place all the contents into their respective folders.
4. If prompted to replace or merge anything, click yes.
5. Load up Super Tanks++.
  - Type ```sm_rcon sm plugins load super_tanks++``` in console.
  - OR restart the server.
6. Customize Super Tanks++ (Config file generated on first load).

### Uninstalling/Upgrading to Newer Versions
1. Delete super_tanks++.smx from addons/sourcemod/plugins folder.
2. Delete super_tanks++.txt from addons/sourcemod/gamedata folder.
3. Delete super_tanks++ folder from addons/sourcemod/scripting folder.
4. Delete super_tanks++.inc from addons/sourcemod/scripting/include folder.
5. Delete super_tanks++ folder from cfg/sourcemod folder.
6. Follow the Installation guide above. (Only for upgrading to newer versions.)

### Disabling
1. Move super_tanks++.smx to plugins/disabled folder.
2. Unload Super Tanks++.
  - Type ```sm_rcon sm plugins unload super_tanks++``` in console.
  - OR restart the server.

## Features
1. Supports multiple game modes - Provides the option to enable/disable the plugin in certain game modes.
2. Custom configurations - Provides support for custom configurations, whether per difficulty, per map, per game mode, per day, or per player count.
3. Lock/unlock convar values - Provides the option to temporarily lock/unlock convar values across map changes.
4. Automatic config updater - Provides the ability to update the main config file when new convars are added.

## Super Tank Types
Super Tanks++ provides 36 (31 for L4D1) unique Tank types.

- Acid (Switches to Puke in L4D1)
```
Spawns acid puddles underneath survivors.
```

- Ammo
```
Takes away survivors' ammunition.
```

- Blind
```
Blinds survivors.
```

- Bomb
```
Causes explosions.
```

- Boomer
```
Throws Boomers at survivors.
```

- Charger (Switches to Smoker in L4D1)
```
Throws Chargers at survivors.
```

- Clone
```
Throws Tanks at survivors.
```

- Common
```
Spawns common infected.
```

- Drug
```
Drugs survivors.
```

- Fire
```
Causes a huge fire in its vicinity.
```

- Flash
```
"My name is Tank, and I am the fastest Tank alive. With the help of my special infected friends, I destroy survivors and stop them from getting to the saferoom. I am the Flash!"
```

- Fling (Switches to Jumper in L4D1)
```
Flings survivors into the air.
```

- Ghost
```
Has temporary invisibility and disarms survivors.
```

- Gravity
```
Pulls in or pushes away survivors and changes their gravity.
```

- Heal
```
Absorbs health from other infected and sets survivors to black and white with temporary health.
```

- Hunter
```
Throws Hunters at survivors.
```

- Hypno
```
Hypnotizes survivors to attack themselves.
```

- Ice
```
Freezes survivors.
```

- Idle
```
Makes survivors go idle.
```

- Invert
```
Inverts survivors' movement keys.
```

- Jockey (Switches to Hunter in L4D1)
```
Throws Jockeys at survivors.
```

- Jumper
```
Jumps sporadically to throw survivors off.
```

- Meteor
```
Causes a meteor shower.
```

- Puke
```
Pukes on survivors.
```

- Restart
```
Causes survivors to respawn at the start of the map or next to the nearest teammate.
```

- Rocket
```
Sends survivors into space.
```

- Shake
```
Shakes survivors' screens.
```

- Shield
```
Spawns with a shield and throws propane Tanks to help survivors take down its shield for a brief moment.
```

- Shove
```
Shoves survivors.
```

- Slug
```
Moves slowly but can smite survivors.
```

- Smoker
```
Throws Smokers at survivors.
```

- Spitter (Switches to Boomer in L4D1)
```
Throws Spitters at survivors.
```

- Stun
```
Stuns and slows down survivors.
```

- Visual
```
Changes survivors' field of views.
```

- Warp
```
Warps to a random survivor.
```

- Witch
```
Throws Witches at survivors.
```

## Configuration Variables (ConVars/CVars)
```
// Announce each Super Tank's arrival?
// (0: OFF)
// (1: ON)
// -
// Default: "1"
// Minimum: "0.000000"
// Maximum: "1.000000"
st_announcearrival "1"

// Disable Super Tanks++ in these game modes.
// Separate game modes with commas.
// Game mode limit: 64
// Character limit for each game mode: 32
// (Empty: None)
// (Not empty: Disabled only in these game modes.)
// -
// Default: ""
st_disabledgamemodes ""

// Display Tanks' names and health?
// (0: OFF)
// (1: ON, show names only.)
// (2: ON, show health only.)
// (3: ON, show both names and health.)
// -
// Default: "3"
// Minimum: "0.000000"
// Maximum: "3.000000"
st_displayhealth "3"

// Enable Super Tanks++?
// (0: OFF)
// (1: ON)
// -
// Default: "1"
// Minimum: "0.000000"
// Maximum: "1.000000"
st_enable "1"

// Enable Super Tanks++ in these game modes.
// Separate game modes with commas.
// Game mode limit: 64
// Character limit for each game mode: 32
// (Empty: All)
// (Not empty: Enabled only in these game modes.)
// -
// Default: ""
st_enabledgamemodes ""

// Enable Super Tanks++ in finales only?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
st_finalesonly "0"

// Enable Super Tanks++ in these game mode types.
// Add numbers up together.
// (0: All 4 types.)
// (1: Co-Op modes only.)
// (2: Versus modes only.)
// (4: Survival modes only.)
// (8: Scavenge modes only.)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "15.000000"
st_gamemodetypes "0"

// Enable Super Tanks++ for human-controlled Tanks?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
st_humansupport "0"

// Which Super Tank types can be spawned?
// Combine letters and numbers in any order for different results.
// Repeat the same letter or number to increase its chance of being chosen.
// Character limit: 52
// View the README.md file for a list of options.
// -
// Default: "0123456789abcdefghijklmnopqrstuvwxyz"
st_tanktypes "0123456789abcdefghijklmnopqrstuvwxyz"

// How many Tanks to spawn for each finale wave?
// (1st number = 1st wave)
// (2nd number = 2nd wave)
// (3rd number = 3rd wave)
// -
// Default: "2,3,4"
st_tankwaves "2,3,4"

// Acid Tank has 1 out of this many chances to spawn an acid puddle underneath survivors.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stacid_acidchance "4"

// Attach props to Acid Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stacid_attachprops "1234"

// Extra health given to Acid Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stacid_extrahealth "0"

// Give Acid Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stacid_fireimmunity "0"

// Acid Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stacid_runspeed "1.0"

// These are Acid Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "0,255,125|255,0,0|0,255,125"
stacid_tankcolors "0,255,125|255,0,0|0,255,125"

// Acid Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stacid_throwinterval "5.0"

// Ammo Tank has 1 out of this many chances to take away survivors' ammunition.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stammo_ammochance "4"

// Ammo Tanks can set survivors' ammunition count to this number.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "100.000000"
stammo_ammocount "0"

// Attach props to Ammo Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stammo_attachprops "1234"

// Extra health given to Ammo Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stammo_extrahealth "0"

// Give Ammo Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stammo_fireimmunity "0"

// Ammo Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stammo_runspeed "1.0"

// These are Ammo Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "170,200,210|5,20,35|170,200,210"
stammo_tankcolors "170,200,210|5,20,35|170,200,210"

// Ammo Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stammo_throwinterval "5.0"

// Attach props to Blind Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stblind_attachprops "1234"

// Blind Tank has 1 out of this many chances to make survivors blind.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stblind_blindchance "4"

// Blind Tank's blind effect lasts this long.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stblind_duration "5.0"

// Extra health given to Blind Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stblind_extrahealth "0"

// Give Blind Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stblind_fireimmunity "0"

// Blind Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stblind_runspeed "1.0"

// These are Blind Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "5,0,105|30,20,0|5,0,105"
stblind_tankcolors "5,0,105|30,20,0|5,0,105"

// Blind Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stblind_throwinterval "5.0"

// Attach props to Bomb Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stbomb_attachprops "1234"

// Bomb Tank has 1 out of this many chances to cause an explosion.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stbomb_bombchance "4"

// Extra health given to Bomb Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stbomb_extrahealth "0"

// Give Bomb Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stbomb_fireimmunity "0"

// Bomb Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stbomb_runspeed "1.0"

// These are Bomb Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "75,0,0|15,15,15|75,0,0"
stbomb_tankcolors "75,0,0|15,15,15|75,0,0"

// Bomb Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stbomb_throwinterval "5.0"

// Attach props to Boomer Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stboomer_attachprops "1234"

// Extra health given to Boomer Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stboomer_extrahealth "0"

// Give Boomer Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stboomer_fireimmunity "0"

// Boomer Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stboomer_runspeed "1.0"

// These are Boomer Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "65,105,0|0,0,65|65,105,0"
stboomer_tankcolors "65,105,0|0,0,65|65,105,0"

// Boomer Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stboomer_throwinterval "5.0"

// Attach props to Charger Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stcharger_attachprops "1234"

// Extra health given to Charger Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stcharger_extrahealth "0"

// Give Charger Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stcharger_fireimmunity "0"

// Charger Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stcharger_runspeed "1.0"

// These are Charger Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "95,140,80|25,255,115|95,140,80"
stcharger_tankcolors "95,140,80|25,255,115|95,140,80"

// Charger Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stcharger_throwinterval "5.0"

// Attach props to Clone Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stclone_attachprops "1234"

// Extra health given to Clone Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stclone_extrahealth "0"

// Give Clone Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stclone_fireimmunity "0"

// Clone Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stclone_runspeed "1.0"

// These are Clone Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "10,25,205|140,40,255|10,25,205"
stclone_tankcolors "10,25,205|140,40,255|10,25,205"

// Clone Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stclone_throwinterval "5.0"

// Attach props to Common Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stcommon_attachprops "1234"

// Extra health given to Common Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stcommon_extrahealth "0"

// Give Common Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stcommon_fireimmunity "0"

// Common Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stcommon_runspeed "1.0"

// Common Tank's common infected mob spawn interval.
// -
// Default: "15.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stcommon_spawninterval "15.0"

// These are Common Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "165,205,175|190,255,250|165,205,175"
stcommon_tankcolors "165,205,175|190,255,250|165,205,175"

// Common Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stcommon_throwinterval "5.0"

// Which type of custom config should Super Tanks++ create?
// Combine numbers in any order for different results.
// Character limit: 5
// (1: Difficulties)
// (2: Maps)
// (3: Game modes)
// (4: Days)
// (5: Player count)
// -
// Default: "31425"
stconfig_createtype "31425"

// Enable Super Tanks++ custom configuration?
// (0: OFF)
// (1: ON)
// -
// Default: "1"
// Minimum: "0.000000"
// Maximum: "1.000000"
stconfig_enable "1"

// Which type of custom config should Super Tanks++ execute?
// Combine numbers in any order for different results.
// Character limit: 5
// (1: Difficulties)
// (2: Maps)
// (3: Game modes)
// (4: Days)
// (5: Player count)
// -
// Default: "1"
stconfig_executetype "1"

// What is the time offset of the server?
// How it works:
// Server time + stconfig_timeoffset
// Example:
// stconfig_timeoffset "+10"
// 12:00 PM + 10 = 10:00 PM
// stconfig_timeoffset "-10"
// 12:00 PM - 10 = 2:00 AM
// -
// Default: ""
stconfig_timeoffset ""

// Extra health given to Default Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stdefault_extrahealth "0"

// Give Default Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stdefault_fireimmunity "0"

// Default Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stdefault_runspeed "1.0"

// Default Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stdefault_throwinterval "5.0"

// Attach props to Drug Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stdrug_attachprops "1234"

// Drug Tank has 1 out of this many chances to drug survivors.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stdrug_drugchance "4"

// Drug Tank's drug effect lasts this long.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stdrug_duration "5.0"

// Extra health given to Drug Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stdrug_extrahealth "0"

// Give Drug Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stdrug_fireimmunity "0"

// Drug Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stdrug_runspeed "1.0"

// These are Drug Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "255,245,0|55,205,65|255,245,0"
stdrug_tankcolors "255,245,0|55,205,65|255,245,0"

// Drug Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stdrug_throwinterval "5.0"

// Attach props to Fire Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stfire_attachprops "1234"

// Extra health given to Fire Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stfire_extrahealth "0"

// Fire Tank has 1 out of this many chances to cause a fire.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stfire_firechance "4"

// Give Fire Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stfire_fireimmunity "0"

// Fire Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stfire_runspeed "1.0"

// These are Fire Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "150,0,0|255,135,0|150,0,0"
stfire_tankcolors "150,0,0|255,135,0|150,0,0"

// Fire Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stfire_throwinterval "5.0"

// Attach props to Flash Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stflash_attachprops "1234"

// Extra health given to Flash Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stflash_extrahealth "0"

// Give Flash Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stflash_fireimmunity "0"

// Flash Tank has 1 out of this many chances to use its special speed.
// -
// Default: "3"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stflash_flashchance "3"

// Flash Tank's run speed.
// -
// Default: "3.0"
// Minimum: "0.100000"
// Maximum: "3.000000"
stflash_runspeed "3.0"

// Flash Tank's special speed.
// -
// Default: "5.0"
// Minimum: "3.000000"
// Maximum: "5.000000"
stflash_specialspeed "5.0"

// These are Flash Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "255,0,0|255,255,0|255,0,0"
stflash_tankcolors "255,0,0|255,255,0|255,0,0"

// Flash Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stflash_throwinterval "5.0"

// Attach props to Fling Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stfling_attachprops "1234"

// Extra health given to Fling Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stfling_extrahealth "0"

// Give Fling Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stfling_fireimmunity "0"

// Fling Tank has 1 out of this many chances to fling survivors into the air.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stfling_flingchance "4"

// Fling Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stfling_runspeed "1.0"

// These are Fling Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "160,225,65|25,40,130|160,225,65"
stfling_tankcolors "160,225,65|25,40,130|160,225,65"

// Fling Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stfling_throwinterval "5.0"

// Attach props to Ghost Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stghost_attachprops "1234"

// Extra health given to Ghost Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stghost_extrahealth "0"

// Give Ghost Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stghost_fireimmunity "0"

// Ghost Tank has 1 out of this many chances to disarm survivors.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stghost_ghostchance "4"

// Ghost Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stghost_runspeed "1.0"

// These are Ghost Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "50,50,50|150,150,150|50,50,50"
stghost_tankcolors "50,50,50|150,150,150|50,50,50"

// Ghost Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stghost_throwinterval "5.0"

// Which weapon slots can Ghost Tank disarm?
// Combine numbers in any order for different results.
// Character limit: 5
// (1: 1st slot only.)
// (2: 2nd slot only.)
// (3: 3rd slot only.)
// (4: 4th slot only.)
// (5: 5th slot only.)
// -
// Default: "12345"
stghost_weaponslot "12345"

// Attach props to Gravity Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stgravity_attachprops "1234"

// Extra health given to Gravity Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stgravity_extrahealth "0"

// Give Gravity Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stgravity_fireimmunity "0"

// Gravity Tank has 1 out of this many chances to change survivors' gravity'.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stgravity_gravitychance "4"

// Gravity Tank's force.
// (Positive numbers = Push back)
// (Negative numbers = Pull back)
// -
// Default: "-50.0"
// Minimum: "-100.000000"
// Maximum: "100.000000"
stgravity_gravityforce "-50.0"

// Gravity Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stgravity_runspeed "1.0"

// These are Gravity Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "25,25,25|255,0,0|25,25,25"
stgravity_tankcolors "25,25,25|255,0,0|25,25,25"

// Gravity Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stgravity_throwinterval "5.0"

// Attach props to Heal Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stheal_attachprops "1234"

// Health absorbed from common infected.
// -
// Default: "100"
// Minimum: "0.000000"
// Maximum: "1000.000000"
stheal_commonamount "100"

// Extra health given to Heal Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stheal_extrahealth "0"

// Give Heal Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stheal_fireimmunity "0"

// Heal Tank has 1 out of this many chances to make survivors black and white with temporary health.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stheal_healchance "4"

// Heal Tank's heal interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stheal_healinterval "5.0"

// Heal Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stheal_runspeed "1.0"

// Health absorbed from other special infected.
// -
// Default: "500"
// Minimum: "0.000000"
// Maximum: "10000.000000"
stheal_specialamount "500"

// Health absorbed from other Tanks.
// -
// Default: "500"
// Minimum: "0.000000"
// Maximum: "100000.000000"
stheal_tankamount "500"

// These are Heal Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "75,200,75|255,255,255|75,200,75"
stheal_tankcolors "75,200,75|255,255,255|75,200,75"

// Heal Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stheal_throwinterval "5.0"

// Attach props to Hunter Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
sthunter_attachprops "1234"

// Extra health given to Hunter Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
sthunter_extrahealth "0"

// Give Hunter Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
sthunter_fireimmunity "0"

// Hunter Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
sthunter_runspeed "1.0"

// These are Hunter Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "0,80,140|200,200,200|0,80,140"
sthunter_tankcolors "0,80,140|200,200,200|0,80,140"

// Hunter Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
sthunter_throwinterval "5.0"

// Attach props to Hypno Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
sthypno_attachprops "1234"

// Hypno Tank's hypnosis effect lasts this long.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
sthypno_duration "5.0"

// Extra health given to Hypno Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
sthypno_extrahealth "0"

// Give Hypno Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
sthypno_fireimmunity "0"

// Hypno Tank has 1 out of this many chances to hypnotize survivors.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
sthypno_hypnochance "4"

// Hypno Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
sthypno_runspeed "1.0"

// These are Hypno Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "110,0,130|255,250,45|110,0,130"
sthypno_tankcolors "110,0,130|255,250,45|110,0,130"

// Hypno Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
sthypno_throwinterval "5.0"

// Attach props to Ice Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stice_attachprops "1234"

// Extra health given to Ice Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stice_extrahealth "0"

// Give Ice Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stice_fireimmunity "0"

// Ice Tank has 1 out of this many chances to freeze survivors.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stice_icechance "4"

// Ice Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stice_runspeed "1.0"

// These are Ice Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "0,155,255|170,240,255|0,155,255"
stice_tankcolors "0,155,255|170,240,255|0,155,255"

// Ice Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stice_throwinterval "5.0"

// Attach props to Idle Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stidle_attachprops "1234"

// Extra health given to Idle Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stidle_extrahealth "0"

// Give Idle Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stidle_fireimmunity "0"

// Idle Tank has 1 out of this many chances to make survivors go idle.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stidle_idlechance "4"

// Idle Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stidle_runspeed "1.0"

// These are Idle Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "225,235,255|10,40,15|225,235,255"
stidle_tankcolors "225,235,255|10,40,15|225,235,255"

// Idle Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stidle_throwinterval "5.0"

// Attach props to Invert Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stinvert_attachprops "1234"

// Invert Tank's inversion effect lasts this long.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stinvert_duration "5.0"

// Extra health given to Invert Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stinvert_extrahealth "0"

// Give Invert Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stinvert_fireimmunity "0"

// Invert Tank has 1 out of this many chances to invert survivors' movement keys.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stinvert_invertchance "4"

// Invert Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stinvert_runspeed "1.0"

// These are Invert Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "0,235,220|250,65,255|0,235,220"
stinvert_tankcolors "0,235,220|250,65,255|0,235,220"

// Invert Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stinvert_throwinterval "5.0"

// Attach props to Jockey Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stjockey_attachprops "1234"

// Extra health given to Jockey Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stjockey_extrahealth "0"

// Give Jockey Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stjockey_fireimmunity "0"

// Jockey Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stjockey_runspeed "1.0"

// These are Jockey Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "255,235,235|130,0,0|255,235,235"
stjockey_tankcolors "255,235,235|130,0,0|255,235,235"

// Jockey Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stjockey_throwinterval "5.0"

// Attach props to Jumper Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stjumper_attachprops "1234"

// Jumper Tank has 1 out of this many chances to jump into the air.
// -
// Default: "3"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stjumper_jumpchance "3"

// Jumper Tank's jump interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stjumper_jumpinterval "5.0"

// Extra health given to Jumper Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stjumper_extrahealth "0"

// Give Jumper Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stjumper_fireimmunity "0"

// Jumper Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stjumper_runspeed "1.0"

// These are Jumper Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "225,215,0|225,0,205|225,215,0"
stjumper_tankcolors "225,215,0|225,0,205|225,215,0"

// Jumper Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stjumper_throwinterval "5.0"

// Attach props to Meteor Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stmeteor_attachprops "1234"

// Extra health given to Meteor Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stmeteor_extrahealth "0"

// Give Meteor Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stmeteor_fireimmunity "0"

// Meteor Tank has 1 out of this many chances to start a meteor shower.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stmeteor_meteorchance "4"

// Meteor Tank's meteor shower does this much damage.
// -
// Default: "25.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stmeteor_meteordamage "25.0"

// Meteor Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stmeteor_runspeed "1.0"

// These are Meteor Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "120,20,10|200,200,200|120,20,10"
stmeteor_tankcolors "120,20,10|200,200,200|120,20,10"

// Meteor Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stmeteor_throwinterval "5.0"

// Attach props to Puke Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stpuke_attachprops "1234"

// Extra health given to Puke Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stpuke_extrahealth "0"

// Give Puke Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stpuke_fireimmunity "0"

// Puke Tank has 1 out of this many chances to puke on survivors.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stpuke_pukechance "4"

// Puke Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stpuke_runspeed "1.0"

// These are Puke Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "170,180,45|140,0,0|170,180,45"
stpuke_tankcolors "170,180,45|140,0,0|170,180,45"

// Puke Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stpuke_throwinterval "5.0"

// Attach props to Restart Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
strestart_attachprops "1234"

// Extra health given to Restart Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
strestart_extrahealth "0"

// Give Restart Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
strestart_fireimmunity "0"

// Restart Tank makes survivors restart with this loadout.
// Separate items with commas.
// Item limit: 5
// Valid formats:
// 1. "rifle,smg,pistol,pain_pills,pipe_bomb"
// 2. "pain_pills,molotov,first_aid_kit,autoshotgun"
// 3. "hunting_rifle,rifle,smg"
// 4. "autoshotgun,pistol"
// 5. "molotov"
// -
// Default: "smg,pistol,pain_pills"
strestart_loadout "smg,pistol,pain_pills"

// Restart Tank has 1 out of this many chances to make survivors restart.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
strestart_restartchance "4"

// Restart Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
strestart_runspeed "1.0"

// These are Restart Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "10,40,15|225,235,0|10,40,15"
strestart_tankcolors "10,40,15|225,235,0|10,40,15"

// Restart Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
strestart_throwinterval "5.0"

// Attach props to Rocket Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
strocket_attachprops "1234"

// Extra health given to Rocket Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
strocket_extrahealth "0"

// Give Rocket Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
strocket_fireimmunity "0"

// Rocket Tank has 1 out of this many chances to send survivors into space.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
strocket_rocketchance "4"

// Rocket Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
strocket_runspeed "1.0"

// These are Rocket Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "250,110,0|255,180,50|250,110,0"
strocket_tankcolors "250,110,0|255,180,50|250,110,0"

// Rocket Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
strocket_throwinterval "5.0"

// Attach props to Shake Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stshake_attachprops "1234"

// Shake Tank's shake effect lasts this long.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stshake_duration "5.0"

// Extra health given to Shake Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stshake_extrahealth "0"

// Give Shake Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stshake_fireimmunity "0"

// Shake Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stshake_runspeed "1.0"

// Shake Tank has 1 out of this many chances to shake survivors' screens.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stshake_shakechance "4"

// These are Shake Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "100,25,25|0,170,255|100,25,25"
stshake_tankcolors "100,25,25|0,170,255|100,25,25"

// Shake Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stshake_throwinterval "5.0"

// Attach props to Shield Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stshield_attachprops "1234"

// Extra health given to Shield Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stshield_extrahealth "0"

// Give Shield Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stshield_fireimmunity "0"

// Shield Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stshield_runspeed "1.0"

// Shield Tank's shield reactivates after this many seconds.
// -
// Default: "7.5"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stshield_shielddelay "7.5"

// These are Shield Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "135,205,255|25,125,125|135,205,255"
stshield_tankcolors "135,205,255|25,125,125|135,205,255"

// Shield Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stshield_throwinterval "5.0"

// Attach props to Shove Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stshove_attachprops "1234"

// Shove Tank's shove effect lasts this long.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stshove_duration "5.0"

// Extra health given to Shove Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stshove_extrahealth "0"

// Give Shove Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stshove_fireimmunity "0"

// Shove Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stshove_runspeed "1.0"

// Shove Tank has 1 out of this many chances to shove survivors.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stshove_shovechance "4"

// These are Shove Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "10,100,0|25,10,0|10,100,0"
stshove_tankcolors "10,100,0|25,10,0|10,100,0"

// Shove Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stshove_throwinterval "5.0"

// Attach props to Slug Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stslug_attachprops "1234"

// Extra health given to Slug Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stslug_extrahealth "0"

// Give Slug Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stslug_fireimmunity "0"

// Slug Tank's run speed.
// -
// Default: "0.5"
// Minimum: "0.100000"
// Maximum: "0.500000"
stslug_runspeed "0.5"

// Slug Tank has 1 out of this many chances to smite survivors.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stslug_slugchance "4"

// These are Slug Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "100,165,255|0,0,50|100,165,255"
stslug_tankcolors "100,165,255|0,0,50|100,165,255"

// Slug Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stslug_throwinterval "5.0"

// Attach props to Smoker Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stsmoker_attachprops "1234"

// Extra health given to Smoker Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stsmoker_extrahealth "0"

// Give Smoker Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stsmoker_fireimmunity "0"

// Smoker Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stsmoker_runspeed "1.0"

// These are Smoker Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "150,0,150|200,100,145|150,0,150"
stsmoker_tankcolors "150,0,150|200,100,145|150,0,150"

// Smoker Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stsmoker_throwinterval "5.0"

// Attach props to Spitter Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stspitter_attachprops "1234"

// Extra health given to Spitter Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stspitter_extrahealth "0"

// Give Spitter Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stspitter_fireimmunity "0"

// Spitter Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stspitter_runspeed "1.0"

// These are Spitter Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "0,200,0|255,80,150|0,200,0"
stspitter_tankcolors "0,200,0|255,80,150|0,200,0"

// Spitter Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stspitter_throwinterval "5.0"

// Attach props to Stun Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
ststun_attachprops "1234"

// Stun Tank's stun effect lasts this long.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
ststun_duration "5.0"

// Extra health given to Stun Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
ststun_extrahealth "0"

// Give Stun Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
ststun_fireimmunity "0"

// Stun Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
ststun_runspeed "1.0"

// Stun Tank has 1 out of this many chances to stun survivors.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
ststun_stunchance "4"

// Stun Tank can set survivors' run speed to this amount.
// -
// Default: "0.25"
// Minimum: "0.100000"
// Maximum: "0.990000"
ststun_stunspeed "0.25"

// These are Stun Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "80,130,255|255,185,45|80,130,255"
ststun_tankcolors "80,130,255|255,185,45|80,130,255"

// Stun Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
ststun_throwinterval "5.0"

// Attach props to Visual Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stvisual_attachprops "1234"

// Visual Tank's visual effect lasts this long.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stvisual_duration "5.0"

// Extra health given to Visual Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stvisual_extrahealth "0"

// Give Visual Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stvisual_fireimmunity "0"

// Visual Tank can set survivors' field of view to this amount.
// -
// Default: "160"
// Minimum: "1.000000"
// Maximum: "160.000000"
stvisual_fov "160"

// Visual Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stvisual_runspeed "1.0"

// These are Visual Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "175,25,205|255,40,10|175,25,205"
stvisual_tankcolors "175,25,205|255,40,10|175,25,205"

// Visual Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stvisual_throwinterval "5.0"

// Visual Tank has 1 out of this many chances to change survivors' field of views.
// -
// Default: "4"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stvisual_visualchance "4"

// Attach props to Warp Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stwarp_attachprops "1234"

// Extra health given to Warp Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stwarp_extrahealth "0"

// Give Warp Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stwarp_fireimmunity "0"

// Warp Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stwarp_runspeed "1.0"

// These are Warp Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "130,130,255|225,100,0|130,130,255"
stwarp_tankcolors "130,130,255|225,100,0|130,130,255"

// Warp Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stwarp_throwinterval "5.0"

// Warp Tank's warp interval.
// -
// Default: "10"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stwarp_warpinterval "10"

// Attach props to Witch Tank?
// Combine numbers in any order for different results.
// Character limit: 4
// (1: attach lights only.)
// (2: attach oxygen tanks only.)
// (3: attach rocks only.)
// (4: attach tires only.)
// -
// Default: "1234"
stwitch_attachprops "1234"

// Extra health given to Witch Tank.
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "99999.000000"
stwitch_extrahealth "0"

// Give Witch Tank fire immunity?
// (0: OFF)
// (1: ON)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
stwitch_fireimmunity "0"

// Witch Tank's run speed.
// -
// Default: "1.0"
// Minimum: "0.100000"
// Maximum: "2.000000"
stwitch_runspeed "1.0"

// These are Witch Tank's colors.
// 1st set = skin color
// 2nd set = prop color
// 3rd set = glow color
// -
// Default: "255,145,255|255,210,80|255,145,255"
stwitch_tankcolors "255,145,255|255,210,80|255,145,255"

// Witch Tank's rock throw interval.
// -
// Default: "5.0"
// Minimum: "1.000000"
// Maximum: "99999.000000"
stwitch_throwinterval "5.0"
```

### Locking/Unlocking ConVar values

Super Tanks++ provides the option to lock/unlock convar values. By locking a convar's value, Super Tanks++ will prevent convars from reverting to their default values across map changes until the server ends or restarts.

> The default lock and unlock switch symbols are "==" and "!=" respectively. You can change these on lines 14 and 15 in the super_tanks++.inc file. The character limit for both is 2.

#### Usage:
Normal
```
st_tanktypes "abc" // Value set in super_tanks++.cfg.
st_tanktypes "def" // Value set during a map.
Map changes...
st_tanktypes "abc" // Value after map changes.
```

Lock
```
st_tanktypes "abc" // Value set in super_tanks++.cfg.
st_tanktypes "==def" // Value set during a map.
Map changes...
st_tanktypes "def" // Value after map changes.
```

Unlock
```
st_tanktypes "abc" // Value set in super_tanks++.cfg.
st_tanktypes "!=def" // Value set during a map.
Map changes...
st_tanktypes "abc" // Value after map changes.
```

### Custom Configuration Files
Super Tanks++ has features that allow for creating and executing custom configuration files.

> Any convars written inside these custom config files will be executed. These files are only created/executed by Super Tanks++.

By default, Super Tanks++ can create and execute the following types of configurations:
1. Difficulty - Files are created/executed based on the current game difficulty. (Example: If the current z_difficulty is set to Impossible (Expert mode), then "impossible.cfg" is executed (or created if it doesn't exist already).
2. Map - Files are created/executed based on the current map. (Example: If the current map is c1m1_hotel, then "c1m1_hotel.cfg" is executed (or created if it doesn't exist already).
3. Game mode - Files are created/executed based on the current game mode. (Example: If the current game mode is Versus, then "versus.cfg" is executed (or created if it doesn't exist already).
4. Daily - Files are created/executed based on the current day. (Example: If the current day is Friday, then "friday.cfg" is executed (or created if it doesn't exist already).
5. Player count - Files are created/executed based on the current number of human players. (Example: If the current number is 8, then "8.cfg" is executed (or created if it doesn't exist already).

#### Features
1. Create custom config files (can be based on difficulty, map, game mode, day, player count, or custom name).
2. Execute custom config files (can be based on difficulty, map, game mode, day, player count, or custom name).
3. Automatically generate config files for all difficulties specified by z_difficulty.
4. Automatically generate config files for all maps installed on the server.
5. Automatically generate config files for all game modes specified by sv_gametypes and mp_gamemode.
6. Automatically generate config files for all days.
7. Automatically generate config files for up to 66 players.

## Questions You May Have
> If you have any questions that aren't addressed below, feel free to message me or post on this [thread](https://forums.alliedmods.net/showthread.php?t=302140).

### Main Features
1. How do I enable/disable the plugin in certain game modes?

You have 2 options:

- Enable/disable in certain game mode types.
- Enable/disable in specific game modes.

For option 1:

You must add numbers up together.

For option 2:

You must specify the game modes in the das_enabledgamemodes and das_disabledgamemodes convars.

Here are some scenarios and their outcomes:

- Scenario 1
```
st_gamemodetypes "1" // The plugin is enabled for all Campaign modes only (coop, mutation1, etc.).
st_enabledgamemodes "" // The plugin is enabled in all game modes.
st_disabledgamemodes "coop" // The plugin is disabled in "coop" mode.

Outcome: The plugin works in every Campaign-based game mode like "mutation1" except "coop" mode.
```
- Scenario 2
```
st_gamemodetypes "8" // The plugin is enabled for all Scavenge modes only (teamscavenge, scavenge, etc.)
st_enabledgamemodes "coop" // The plugin is enabled in only "coop" mode.
st_disabledgamemodes "" // The plugin is not disabled in any game modes.

Outcome: The plugin works in every Scavenge-based game mode like "teamscavenge" and "scavenge" modes.
```
- Scenario 3
```
st_gamemodetypes "0" // The plugin is enabled for all game mode types.
st_enabledgamemodes "coop,versus" // The plugin is enabled in only "coop" and "versus" mode.
st_disabledgamemodes "coop" // The plugin is disabled in "coop" mode.

Outcome: The plugin works only in "versus" mode.
```

2. How do I make the plugin to work on only finale maps?

Set the value of st_finalesonly to 1.

3. How can I change the amount of Tanks that spawn on each finale wave?

Here's an example:

```
st_tankwaves "2,3,4" // Spawn 2 Tanks on the 1st wave, 3 Tanks on the 2nd wave, and 4 Tanks on the 3rd wave
```

4. How can I decide whether to display each Tank's health?

Set the value in st_displayhealth.

5. How do I give each Tank more health?

Set the value in the convars with the extrahealth suffix.

Example:

```
stflash_extrahealth "5000" // Add 5000 to Flash Tank's health.
```

6. How do I adjust each Tank's run speed?

Set the value in the convars with the extrahealth suffix.

Example:

```
stflash_runspeed "3.0" // Add 2.0 to Flash Tank's speed. Default speed is 1.0.
```

7. How can I give each Tank fire immunity?

Set the value of any convars with the fireimmunity suffix to 1.

8. How can I delay the throw interval of each Tank?

Set the value in the convars with the extrahealth suffix.

Example:

```
stflash_throwinterval "8.0" // Add 3.0 to Flash Tank's throw interval. Default interval is 5.0.
```

9. Why do some Tanks spawn with different props?

Since v8.9, there's a randomizer that determines which props Tanks spawn with.

10. Why are the Tanks spawning with more than the extra health given to them?

Since v8.10, extra health given to Tanks is now multiplied by the number of alive non-idle human survivors present when the Tank spawns.

11. Are there any developer/tester features available in the plugin?

Yes, there are target filters for each special infected and the sm_tank command that allows developers/testers to spawn each Super Tank.

List of target filters:

```
@smokers
@boomers
@hunters
@spitters
@jockeys
@chargers
@witches
@tanks
```

Command usage:

```
sm_tank <type 1-36>
```

12. What are the different Tank types?

```
1. Acid // Add "0" to st_tanktypes to use.
2. Ammo // Add "1" to st_tanktypes to use.
3. Blind // Add "2" to st_tanktypes to use.
4. Bomb // Add "3" to st_tanktypes to use.
5. Boomer // Add "4" to st_tanktypes to use.
6. Charger // Add "5" to st_tanktypes to use.
7. Clone // Add "6" to st_tanktypes to use.
8. Common // Add "7" to st_tanktypes to use.
8. Drug // Add "8" to st_tanktypes to use.
10. Fire // Add "9" to st_tanktypes to use.
11. Flash // Add "a" to st_tanktypes to use.
12. Fling // Add "b" to st_tanktypes to use.
13. Ghost // Add "c" to st_tanktypes to use.
14. Gravity // Add "d" to st_tanktypes to use.
15. Heal // Add "e" to st_tanktypes to use.
16. Hunter // Add "f" to st_tanktypes to use.
17. Hypno // Add "g" to st_tanktypes to use.
18. Ice // Add "h" to st_tanktypes to use.
19. Idle // Add "i" to st_tanktypes to use.
20. Invert // Add "j" to st_tanktypes to use.
21. Jockey // Add "k" to st_tanktypes to use.
22. Jumper // Add "l" to st_tanktypes to use.
23. Meteor // Add "m" to st_tanktypes to use.
24. Puke // Add "n" to st_tanktypes to use.
25. Restart // Add "o" to st_tanktypes to use.
26. Rocket // Add "p" to st_tanktypes to use.
27. Shake // Add "q" to st_tanktypes to use.
28. Shield // Add "r" to st_tanktypes to use.
29. Shove // Add "s" to st_tanktypes to use.
30. Slug // Add "t" to st_tanktypes to use.
31. Smoker // Add "u" to st_tanktypes to use.
32. Spitter // Add "v" to st_tanktypes to use.
33. Stun // Add "w" to st_tanktypes to use.
34. Visual // Add "x" to st_tanktypes to use.
35. Warp // Add "y" to st_tanktypes to use.
36. Witch // Add "z" to st_tanktypes to use.
```

### Configuration
1. How do I enable the custom configurations features?

Set stconfig_enable to 1.

2. How do I tell the plugin to only create certain custom config files?

Set the values in stconfig_createtype.

Examples:
```
stconfig_createtype "123" // Creates the folders and config files for each difficulty, map, and game mode.
stconfig_createtype "4" // Creates the folder and config files for each day.
stconfig_createtype "12345" // Creates the folders and config files for each difficulty, map, game mode, day, and player count.
```

3. How do I tell the plugin to only execute certain custom config files?

Set the values in stconfig_executetype.

Examples:
```
stconfig_executetype "123" // Executes the config file for the current difficulty, map, and game mode.
stconfig_executetype "4" // Executes the config file for the current day.
stconfig_executetype "12345" // Executes the config file for the current difficulty, map, game mode, day, and player count.
```

4. How can I make the Daily configs execute during a certain time of the day?

Set the time offset value in stconfig_timeoffset.

Examples:
```
stconfig_timeoffset "+10" // Adds 10 hours to the server time.
stconfig_timeoffset "-10" // Subtracts 10 hours to the server time.
```

## Credits
**NgBUCKWANGS** - For the mapname.cfg and convar switch code in his [ABM](https://forums.alliedmods.net/showthread.php?t=291562) plugin.

**Spirit_12** - For the L4D signatures for the gamedata file.

**honorcode** - For the L4D2 signatures for the gamedata file found in the L4D2 New Custom Commands' gamedata file and the codes to spawn spitter acid puddles, to charge at players, to cause explosions, to ignite players, to set players to black and white, to puke on players, to shake players' screens, and to shove players.

**strontiumdog** - For the [Evil Admin: Mirror Damage](https://forums.alliedmods.net/showthread.php?p=702913), [Evil Admin: Rocket](https://forums.alliedmods.net/showthread.php?t=79617), and [Evil Admin: Vision](https://forums.alliedmods.net/showthread.php?p=702918).

**Marcus101RR** - For the code to set a player's weapon's ammo.

**AtomicStryker** - For the code and gamedata signatures to respawn survivors.

**Farbror Godis** - For the [Curse](https://forums.alliedmods.net/showthread.php?p=2402076) plugin.

**Silvers (Silvershot)** - For the code that allows users to enable/disable the plugin in certain game modes, help with gamedata signatures, the code to prevent Tanks from damaging themselves and other infected with their own abilities, and help with optimizing/fixing various parts of the code.

**Milo|** - For the code that automatically generates config files for each day and each map installed on a server.

**Impact** - For the [AutoExecConfig](https://forums.alliedmods.net/showthread.php?t=204254) include.

**hmmmmm** - For showing me how to pick a random character out of a dynamic string.

**Mi.Cura** - For reporting issues, giving me ideas, and overall continuous support.

**emsit** - For reporting issues and helping with parts of the code.

**ReCreator** - For reporting issues.

**AngelAce113** - For the default colors, testing each Tank type, and giving me ideas.

**Sipow** - For the default colors.

**SourceMod Team** - For the beacon, blind, drug, and ice source codes.

# Contact Me
If you wish to contact me for any questions, concerns, suggestions, or criticism, I can be found here:
- [AlliedModders Forum](https://forums.alliedmods.net/member.php?u=181166)
- [Steam](https://steamcommunity.com/profiles/76561198056665335)

# 3rd-Party Revisions Notice
If you would like to share your own revisions of this plugin, please rename the files! I do not want to create confusion for end-users and it will avoid conflict and negative feedback on the official versions of my work. If you choose to keep the same file names for your revisions, it will cause users to assume that the official versions are the source of any problems your revisions may have. This is to protect you (the reviser) and me (the developer)! Thank you!

# Donate
- [Donate to SourceMod](https://www.sourcemod.net/donate.php)

Thank you very much! :)