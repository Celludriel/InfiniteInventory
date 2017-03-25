params ["_display"];

_container = INFINV_CURRENT_CONTAINER;

_contents = [_container] remoteExecCall InfInv_fnc_getContainerContents;

_lb = _display displayCtrl 1500;
[_lb, _contents] call InfInv_fnc_loadListBoxFromData;