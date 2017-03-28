params ["_data"];

private ["_type"];

_type = [_data] call InfInv_fnc_getWeaponType;

if((primaryWeapon player == "" && _type == "PRIMARY")
        || (secondaryWeapon player == "" && _type == "SECONDARY")
        || (handgunWeapon player == "" && _type == "HANDGUN")) exitWith {
    player addWeapon _data;
};

player addItem _data;