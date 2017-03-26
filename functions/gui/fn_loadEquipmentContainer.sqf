private ["_lb", "_display", "_contents"];

_contents = [] call InfInv_fnc_getPlayerInventoryContents;

_display = findDisplay 1900;
_lb = _display displayCtrl 1501;
[_lb, _contents] call InfInv_fnc_loadListBoxFromData;