params ["_contents"];

private ["_display"];

_display = findDisplay 1900;
_lb = _display displayCtrl 1500;
if(count _contents > 0) then {
    [_lb, _contents] call InfInv_fnc_loadListBoxFromData;
} else {
    lbClear _lb;
};