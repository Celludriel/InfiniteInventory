diag_log format ["Taking item from container"];

_display = findDisplay 1900;
_lb = _display displayCtrl 1501;
_index = lbCurSel _lb;

if(_index != -1) then {
    _data = _lb lbData _index;

    if(_data != "") then {
        [false] call InfInv_fnc_toggleControls;
        player removeItem _data;
        [INFINV_CURRENT_CONTAINER, [_data], clientOwner] remoteExecCall ["InfInv_fnc_addToContainerContents", 2];
    };
};