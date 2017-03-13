if(!isServer || hasInterface) exitWith {};

params ["_container"];

_container setVariable ["INFINV_CONTENTS", []];

[_container, ["ContainerOpened", {
	_container = _this select 0;
	[_container] spawn {
		disableSerialization;

		waitUntil { !isNull ( findDisplay 602 ) };
		_display = findDisplay 602;

		closeDialog 2;

		_container = _this select 0;
		_container call InfInv_fnc_openInventory;			
	};
}]] remoteExec ["addEventHandler", 0, true];