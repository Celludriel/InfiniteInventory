private ["_container", "_contents"];

_container = INFINV_CURRENT_CONTAINER;

[_container, clientOwner] remoteExecCall ["InfInv_fnc_getContainerContents", 2];