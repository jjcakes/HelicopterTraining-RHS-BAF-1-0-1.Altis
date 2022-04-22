if (ferrying) exitWith {};

_spawnPos = _this select 0;
_target = _this select 1;

_groupTaxi = createGroup west;
"rhsusf_army_ocp_teamleader" createUnit [_spawnPos, _groupTaxi,"",0.9, "CORPORAL"];
"rhsusf_army_ocp_machinegunner" createUnit [_spawnPos, _groupTaxi,"",0.8, "PRIVATE"];
"rhsusf_army_ocp_machinegunnera" createUnit [_spawnPos, _groupTaxi,"",0.8, "PRIVATE"];
"rhsusf_army_ocp_rifleman_m4" createUnit [_spawnPos, _groupTaxi,"",0.8, "PRIVATE"];

squadArray = squadArray + [_groupTaxi];