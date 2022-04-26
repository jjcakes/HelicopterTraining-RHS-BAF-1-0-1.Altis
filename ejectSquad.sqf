if (!ferrying) exitWith {};

_group = _this select 0;
_vehicle = _this select 1;

deleteWaypoint [_group,1];

{_x action["eject", vehicle _x]} forEach units _group;
{unAssignVehicle _x} forEach units _group;

ferrying = false;