params ["_item"];
diag_log format ["Removing _item: %1", _item];

_detachWeaponItem = {
    params ["_weaponItem"];
    if(typeName _weaponItem == "ARRAY") then {
        _weaponItem = _weaponItem select 0;
    };

    if(_weaponItem != "") then {
        if(player canAdd _weaponItem) then {
            player addItem _weaponItem;
        } else {
            _ground = "GroundWeaponHolder" createVehicle (position player);
            _ground addItemCargo [_weaponItem, 1];
        };
    };
};

//check if is primary weapon
if( _item == (primaryWeapon player) call Bis_fnc_BaseWeapon) exitWith {
    //if primary weapon and has attachments put attachments in inventory if they can't fit on the ground
    _weaponItems = primaryWeaponItems player;
    removeAllPrimaryWeaponItems player;
    {
        [_x] call _detachWeaponItem;
    } forEach _weaponItems;
    //remove primary weapon
    player removeWeapon (primaryWeapon player);
    true
};

//check if is secondary weapon
if( _item == (secondaryWeapon player) call Bis_fnc_BaseWeapon) exitWith {
    //if secondary weapon and has attachements put attachments in inventory if they can't fit on the ground
    _weaponItems = secondaryWeaponItems player;
    {
        player removeSecondaryWeaponItem _x;
    } forEach _weaponItems;

    {
        [_x] call _detachWeaponItem;
    } forEach _weaponItems;
    //remove secondary weapon
    player removeWeapon (secondaryWeapon player);
    true
};

//check if is handgun
if( _item == (handgunWeapon player) call Bis_fnc_BaseWeapon) exitWith {
    //if handgun and has attachements put attachements in inventory if they can't fit on the ground
    _weaponItems = handgunItems player;
    removeAllHandgunItems player;
    {
        [_x] call _detachWeaponItem;
    } forEach _weaponItems;
    //remove handgun
    player removeWeapon (handgunWeapon player);
    true
};

//remove weapon from uniform if present, put attachments in inventory if they can't put on the ground
_uniform = uniformContainer player;
if(!(isNull _uniform)) then {
    _weaponItems = weaponsItems _uniform;
    {
        if(_item == (_x select 0)) exitWith {
            {
                if(_forEachIndex == 0) then {
                    player removeItemFromUniform _x;
                } else {
                    [_x] call _detachWeaponItem;
                };
            } forEach _x;
            true
        };
    } forEach _weaponItems;
};

//remove weapon from vest if present, put attachments in inventory if they can't put on the ground
_vest = vestContainer player;
if(!(isNull _vest)) then {
    _weaponItems = weaponsItems _vest;
    {
        if(_item == (_x select 0)) exitWith {
            {
                if(_forEachIndex == 0) then {
                    player removeItemFromVest _x;
                } else {
                    [_x] call _detachWeaponItem;
                };
            } forEach _x;
            true
        };
    } forEach _weaponItems;
};

//remove weapon from backpack if present, put attachments in inventory if they can't put on the ground
_backpack = backpackContainer player;
if(!(isNull _backpack)) then {
    _weaponItems = weaponsItems _backpack;
    {
        if(_item == (_x select 0)) exitWith {
            {
                if(_forEachIndex == 0) then {
                    player removeItemFromBackpack _x;
                } else {
                    [_x] call _detachWeaponItem;
                };
            } forEach _x;
            true
        };
    } forEach _weaponItems;
};

//check for attachment
//check if attachment on primary weapon
_weaponItems = primaryWeaponItems player + primaryWeaponMagazine player;
diag_log format ["Removing primaryWeaponItems: %1", _weaponItems];
if(_weaponItems find _item >= 0) exitWith {
    diag_log format ["Removing removePrimaryWeaponItem: %1", _item];
    //remove attachment from primary weapon
    player removePrimaryWeaponItem _item;
    true
};

//check if attachment on secondary weapon
_weaponItems = secondaryWeaponItems player + secondaryWeaponMagazine player;
diag_log format ["Removing secondaryWeaponItems: %1", _weaponItems];
if(_weaponItems find _item >= 0) exitWith {
    diag_log format ["Removing removeSecondaryWeaponItem: %1", _item];
    //remove attachment from secondary weapon
    player removeSecondaryWeaponItem _item;
    true
};

//check if attachment on handgun
_weaponItems = handgunItems player + handgunMagazine player;
diag_log format ["Removing handgunItems: %1", _weaponItems];
if(_weaponItems find _item >= 0) exitWith {
    diag_log format ["Removing removeHandgunItem: %1", _item];
    //remove attachment from handgun
    player removeHandgunItem _item;
    true
};

//check if attachment on any of the carried weapons in inventory
_weaponItems = weaponsItems _vest;
_weaponItems = _weaponItems + (weaponsItems _backpack);
_weaponItems = _weaponItems + (weaponsItems _uniform);
{
    if(_weaponItems find _item >= 0) exitWith {
        //remove from carried weapon in inventory
        //only way is to fake disassembling the weapon and adding each part again except the one we don't want
        //delete the weapon
        player removeItem (_x select 0);
        {
            if(typeName _x == "ARRAY") then {
                _x = _x select 0;
            };

            if(_x != _item && _x != "") then {
                player addItem _x;
            };
        } forEach _x;

        true
    };
} forEach _weaponItems;

//item is only in inventory, remove it
//regular item delete from inventory
player removeItem _item;
true