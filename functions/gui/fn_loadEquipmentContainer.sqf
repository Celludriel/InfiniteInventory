private ["_lb", "_display", "_filter", "_contents"];

//Load listbox
_contents = [] call InfInv_fnc_getPlayerInventoryContents;

_display = findDisplay 1900;
_lb = _display displayCtrl 1501;
_filter = _display displayCtrl 2101;
[_lb, _contents, _filter] call InfInv_fnc_loadListBoxFromData;