params ["_contents"];

private ["_display"];

diag_log format ["InfInv_fnc_getContainerContents contents %1", _contents];

_display = findDisplay 1900;
if(count _contents > 0) then {
    _lb = _display displayCtrl 1500;
    [_lb, _contents] call InfInv_fnc_loadListBoxFromData;
};