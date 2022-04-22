if (ferrying) exitWith {};

_vehicle = _this select 0;
_group = _this select 1;

if (ferrying) exitWith {};

squadLoaded = false;
if ({alive _x} count units _group == 0)
then
{
	squadLoaded = true;
	exit;
};

// Well, that was a bust.
/*
// Get all the available vehicle roles
_vehicleRoles = (typeOf _vehicle) call bis_fnc_vehicleRoles;       // All available roles for the vehicle

//diag_log _vehicleRoles;

// Loop through units trying to put them in turret positions
{
        _unit = _x;
        _assigned = false; // If there's no available turret positions, this will be false after inner loop

        {
                _slot = _x select 0;
                _path = _x select 1;
				
				systemChat format ["slot: %1, path: %2", _slot, _path];

                if (_slot == "Turret" && !(_vehicle lockedTurret _path) && isNull (_vehicle TurretUnit _path)) exitWith {_unit assignAsTurret [_vehicle,_path]; _assigned = true;};

        } forEach _vehicleRoles;

        // Turrets non-existent or full, load him in as baggage
        if (not _assigned) then {
                _unit assignAsCargo _vehicle;     
        };

        // Order the unit into the chopper
        [_unit] orderGetIn true;

} forEach units _group;
*/

{_x assignAsCargo _vehicle} foreach units _group;
{[_x] orderGetIn true} foreach units _group;

{_x disableAI "TARGET"; _x disableAI "AUTOTARGET";} foreach units _group;


_wp = _group addwaypoint [_vehicle,5,1];
_wp setwaypointType "GETIN";

while {not squadLoaded} do
{
	if ({alive _x} count units _group == {_x in _vehicle} count units _group)
	then 
	{
		squadLoaded=true;
	};
	sleep 2;
};
ferrying = true;

