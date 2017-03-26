if(!isServer || hasInterface) exitWith {};

params ["_container", "_items", "_player", "_clientID"];

diag_log format ["Taking from container: %1, %2, %3, %4", _container, _items, _player, _clientID];

{
    private ["_contents", "_currentAmount"];
    if (!(_player canAdd _x)) exitWith {
        ["Not enough inventory space"] remoteExecCall ["InfInv_fnc_showError", _clientID];
    };

    _contents = _container getVariable ["INFINV_CONTENTS", []];
    _currentAmount = [_contents, _x] call BIS_fnc_getFromPairs;
    if(!isNil "_currentAmount") then {

        if(_currentAmount == 1) then {
            [_contents, _x] call BIS_fnc_removeFromPairs;
        } else {
            [_contents, _x, -1] call BIS_fnc_addToPairs;
        };
        _container setVariable ["INFINV_CONTENTS", _contents];
        _container setVariable ["NeedsRefresh", true, true];
        _player addItem _x;
    };
} forEach _items;

[true] remoteExecCall ["InfInv_fnc_toggleControls", _clientID];