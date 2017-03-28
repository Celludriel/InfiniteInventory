#include <..\..\InfiniteInventoryControlIdcList.h>

_display = findDisplay INFINVDIALOG;
_lb = _display displayCtrl INFINVINVENTORYCONTAINER;
_index = lbCurSel _lb;

if(_index != -1) then {
    _data = _lb lbData _index;

    if(_data != "") then {
        if (!(player canAdd _data)) exitWith {
            hint "Not enough inventory space";
        };

        [false] call InfInv_fnc_toggleControls;
        player addItem _data;
        [INFINV_CURRENT_CONTAINER, [_data], player, clientOwner] remoteExecCall ["InfInv_fnc_takeFromContainerContents", 2];
    };
};