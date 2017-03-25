private ["_playerContainers", "_containerContents", "_contents", "_uniform", "_vest", "_backpack", "_lb", "_display"];

_playerContainers = [] call InfInv_fnc_getPlayerContainers;

diag_log format ["_playerContainerGear: %1", _playerContainers];

_containerContents = [];
_contents = [];

_uniform = _playerContainers select 0;
_vest = _playerContainers select 1;
_backpack = _playerContainers select 2;

_containerContents = _containerContents + ([_uniform] call InfInv_fnc_getContentsFromPlayerContainer);
_containerContents = _containerContents + ([_vest] call InfInv_fnc_getContentsFromPlayerContainer);
_containerContents = _containerContents + ([_backpack] call InfInv_fnc_getContentsFromPlayerContainer);

 diag_log format ["Resulting _containerContents: %1", _containerContents];

{
    [_contents, _x select 0, _x select 1] call BIS_fnc_addToPairs;
} forEach _containerContents;

 diag_log format ["Resulting _contents: %1", _contents];

_display = findDisplay 1900;
_lb = _display displayCtrl 1501;
[_lb, _contents] call InfInv_fnc_loadListBoxFromData;