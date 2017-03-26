diag_log format ["Taking item from container"];

_display = findDisplay 1900;
_lb = _display displayCtrl 1500;
_index = lbCurSel _lb;

if(_index != -1) then {
    _data = _lb lbData _index;

    if(_data != "") then {
        if (!(player canAdd _data)) exitWith {
            diag_log format ["Can not add %1", _data];
            hint "Not enough inventory space";
        };

        [false] call InfInv_fnc_toggleControls;
        player addItem _data;
        [INFINV_CURRENT_CONTAINER, [_data], player, clientOwner] remoteExecCall ["InfInv_fnc_takeFromContainerContents", 2];
    };
};