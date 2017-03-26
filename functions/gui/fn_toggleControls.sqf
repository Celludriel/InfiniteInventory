params ["_toggle"];

_display = findDisplay 1900;

_addSingleItemButton = _display displayCtrl 1600;
_takeSingleItemButton = _display displayCtrl 1601;
_takeAllButton = _display displayCtrl 1602;

_addSingleItemButton ctrlEnable _toggle;
_takeSingleItemButton ctrlEnable _toggle;
_takeAllButton ctrlEnable _toggle;