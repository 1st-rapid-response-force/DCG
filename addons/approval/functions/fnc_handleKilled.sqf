/*
Author:
Nicholas Clark (SENSEI)

Description:
handles approval value when object dies

Arguments:
0: killed object <OBJECT>
1: killer object <OBJECT>

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

private ["_unitValue"];
params [
	["_unit", objNull, [objNull]],
	["_killer", objNull, [objNull]]
];

if (isNull _unit || {!isPlayer (driver (vehicle _killer))} || {_killer isEqualTo _unit}) exitWith {};

LOG_DEBUG_5("isSERVER: %1   isDED: %2   OWNER: %3   VICTIM: %4   KILLER: %5",isServer, isDedicated, owner _unit, _unit, _killer);

_unitValue = 0;

call {
	if (_unit isKindOf "Man") exitWith {
		if (side group _unit isEqualTo CIVILIAN) then {
			_unitValue = AV_CIV;
		} else {
			_unitValue = AV_MAN;
			call {
				if (rank _unit isEqualTo "PRIVATE") exitWith {
					_unitValue = _unitValue + (_unitValue*0.10);
				};
				if (rank _unit isEqualTo "CORPORAL") exitWith {
					_unitValue = _unitValue + (_unitValue*0.15);
				};
				if (rank _unit isEqualTo "SERGEANT") exitWith {
					_unitValue = _unitValue + (_unitValue*0.20);
				};
				if (rank _unit isEqualTo "LIEUTENANT") exitWith {
					_unitValue = _unitValue + (_unitValue*0.25);
				};
				if (rank _unit isEqualTo "CAPTAIN") exitWith {
					_unitValue = _unitValue + (_unitValue*0.30);
				};
				if (rank _unit isEqualTo "MAJOR") exitWith {
					_unitValue = _unitValue + (_unitValue*0.35);
				};
				if (rank _unit isEqualTo "COLONEL") exitWith {
					_unitValue = _unitValue + (_unitValue*0.40);
				};
			};
		};
	};
	if (_unit isKindOf "Car") exitWith {
		_unitValue = AV_CAR;
	};
	if (_unit isKindOf "Tank") exitWith {
		_unitValue = AV_TANK;
	};
	if (_unit isKindOf "Air") exitWith {
		_unitValue = AV_AIR;
	};
	if (_unit isKindOf "Ship") exitWith {
		_unitValue = AV_SHIP;
	};
};

if (side group _unit isEqualTo EGVAR(main,playerSide) || {side group _unit isEqualTo CIVILIAN}) then {
	_unitValue = _unitValue * -1;
};

[getPos _unit, _unitValue] call FUNC(addValue);