if(!isServer || hasInterface) exitWith {};

params ["_container"];

diag_log format ["Registering container: %1", _container];

_container setVariable ["INFINV_CONTENTS", []];

[_container, ["ContainerOpened", {
	_container = _this select 0;
	[_container] spawn {
		disableSerialization;
		
		diag_log format ["Finding display 602"];
		waitUntil { !isNull ( findDisplay 602 ) };
		_display = findDisplay 602;
		
		diag_log format ["Display 602 found"];
		
		closeDialog 2;
		
		diag_log format ["Closing 602"];
		
		_container = _this select 0;
		_container call InfInv_fnc_openInventory;			
	};
	

}]] remoteExec ["addEventHandler", 0, true];