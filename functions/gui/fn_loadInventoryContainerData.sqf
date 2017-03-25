private ["_container", "_contents"];

_container = INFINV_CURRENT_CONTAINER;

diag_log format ["Calling InfInv_fnc_getContainerContents with %1", _container];

[_container, clientOwner] remoteExecCall ["InfInv_fnc_getContainerContents", 2];