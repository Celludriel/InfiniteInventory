#include <..\..\InfiniteInventoryControlIdcList.h>

_display = findDisplay INFINVDIALOG;
_lb = _display displayCtrl INFINVINVENTORYCONTAINER;
_index = lbCurSel _lb;

if(_index != -1) then {
    _data = _lb lbData _index;

    if(_data != "") then {
        [false] call InfInv_fnc_toggleControls;

        _type = [_data] call InfInv_fnc_getWeaponType;
        diag_log format ["_type: %1", _type];

        //Check if can fit in primary weapon slot and primary weapon slot of player is empty
        if(primaryWeapon player == "" && _type == "PRIMARY") exitWith {
            diag_log format ["Adding primary", _type];
            player addWeapon _data;
            [INFINV_CURRENT_CONTAINER, [_data], player, clientOwner] remoteExecCall ["InfInv_fnc_takeFromContainerContents", 2];
        };
        //Check if can fit in secondary weapon slot and secondary weapon slot of player is empty
        if(secondaryWeapon player == "" && _type == "SECONDARY") exitWith {
            diag_log format ["Adding secondary", _type];
            player addWeapon _data;
            [INFINV_CURRENT_CONTAINER, [_data], player, clientOwner] remoteExecCall ["InfInv_fnc_takeFromContainerContents", 2];
        };
        //Check if can fit in handgun weapon slot and handgun weapon slot of player is empty
        if(handgunWeapon player == "" && _type == "HANDGUN") exitWith {
            diag_log format ["Adding handgun", _type];
            player addWeapon _data;
            [INFINV_CURRENT_CONTAINER, [_data], player, clientOwner] remoteExecCall ["InfInv_fnc_takeFromContainerContents", 2];
        };

        if (!(player canAdd _data)) exitWith {
            hint "Not enough inventory space";
        };

        player addItem _data;
        [INFINV_CURRENT_CONTAINER, [_data], player, clientOwner] remoteExecCall ["InfInv_fnc_takeFromContainerContents", 2];
    };
};