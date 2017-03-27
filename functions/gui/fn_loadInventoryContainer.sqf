params ["_contents"];

private ["_display", "_lb", "_filter"];

_display = findDisplay 1900;
_lb = _display displayCtrl 1500;
_filter = _display displayCtrl 2100;
if(count _contents > 0) then {
    [_lb, _contents, _filter] call InfInv_fnc_loadListBoxFromData;
} else {
    lbClear _lb;
};