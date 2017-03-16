params ["_playerContainer"];

_contents = [];

_items = _playerContainer select 1;
_weapons = _playerContainer select 2;

{
    [_contents, _x, 1] call BIS_fnc_addToPairs;
} forEach _items;

{
    {
        if(typeName _x != "ARRAY") then {
            if(_item != "") then {
                [_contents, _x, 1] call BIS_fnc_addToPairs;
            };
        };

        if(typeName _x == "ARRAY") then {
            _item = _x select 0;
            if(_item != "") then {
                [_contents, _item, 1] call BIS_fnc_addToPairs;
            };
        };

    } forEach _x;
} forEach _weapons;

diag_log format ["_contents: %1", _contents];

_contents
/* _playerContainerGear =
[
    [
        ["U_B_CombatUniform_mcam",
            ["FirstAidKit"],
            [["30Rnd_65x39_caseless_mag",30],["30Rnd_65x39_caseless_mag",30]],
            []
        ],
        ["V_PlateCarrier1_rgr",
            [],
            [["Chemlight_green",1],["HandGrenade",1],["30Rnd_65x39_caseless_mag",30],["11Rnd_45ACP_Mag",11],["11Rnd_45ACP_Mag",11],["11Rnd_45ACP_Mag",11]],
            []
        ],
        ["B_Carryall_khk",
            [],
            [["11Rnd_45ACP_Mag",11],["11Rnd_45ACP_Mag",11],["1Rnd_HE_Grenade_shell",1],["1Rnd_HE_Grenade_shell",1],["1Rnd_HE_Grenade_shell",1],["MiniGrenade",1],["HandGrenade",1],["HandGrenade",1],["SatchelCharge_Remote_Mag",1]],
            [["arifle_MX_GL_F","","acc_pointer_IR","optic_Aco",["30Rnd_65x39_caseless_mag",30],["1Rnd_HE_Grenade_shell",1],""]]
        ]
    ]
]; */

