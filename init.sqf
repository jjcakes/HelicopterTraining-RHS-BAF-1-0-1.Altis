null = execVM "briefing.sqf";

//Handle parameters

// Replaced paramsArray w/ BIS_fnc_getParamValue - JJ

//Time of day
//_time = paramsArray select 0;
_time = "DayTime" call BIS_fnc_getParamValue;
if (_time != 1) then
{
	skiptime _time;
}
else
{
	skiptime (floor random 24);
};

//LZ size
//lzSize = paramsArray select 1;
lzSize = "LZSize" call BIS_fnc_getParamValue;
publicVariable "lzSize";

//Smoke setting
smokeSetting = "SmokeSetting" call BIS_fnc_getParamValue;
//bSmoke = if ((paramsArray select 2) == 1) then {true} else {false};
bSmoke = if (smokeSetting == 1) then {true} else {false};
publicVariable "bSmoke";

//Hot LZ chance
//_hotLZParam = paramsArray select 3;
_hotLZParam = "HotLZProbability" call BIS_fnc_getParamValue;
hotLZChance = if (_hotLZParam > 0) then {_hotLZParam / 100} else {0.0};
publicVariable "hotLZChance";

//Anti air chance
//_AAParam = paramsArray select 4;
_AAParam = "AAProbability" call BIS_fnc_getParamValue;
AAChance = if (_AAParam > 0) then {_AAParam / 100} else {0.0};
publicVariable "AAChance";

squadArray = [];
enemyArray = [];
AAArray = [];

missionInitComplete = true;
publicVariable "missionInitComplete";

