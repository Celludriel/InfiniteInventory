if(!isServer || hasInterface) exitWith {};

params ["_container", "_clientID"];

diag_log format ["Getting data from %1", _container];

_retValue = _container getVariable ["INFINV_CONTENTS", []];

diag_log format ["Data %1", _retValue];

[_retValue] remoteExecCall ["InfInv_fnc_loadInventoryContainer", _clientID];