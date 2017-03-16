_playerContainers = [] call InfInv_fnc_getPlayerContainers;

diag_log format ["_playerContainerGear: %1", _playerContainers];

_contents = [];

_uniform = _playerContainers select 0;
_vest = _playerContainers select 1;
_backpack = _playerContainers select 2;

_contents = _contents + ([_uniform] call InfInv_fnc_getContentsFromPlayerContainer);
_contents = _contents + ([_vest] call InfInv_fnc_getContentsFromPlayerContainer);
_contents = _contents + ([_backpack] call InfInv_fnc_getContentsFromPlayerContainer);

 diag_log format ["Resulting _contents: %1", _contents];

/*

20:33:28 "_playerContainerGear: [[""U_B_CombatUniform_mcam"",[""FirstAidKit"",""Chemlight_green"",""30Rnd_65x39_caseless_mag"",""30Rnd_65x39_caseless_mag""],[]],[""V_PlateCarrier1_rgr"",[""SmokeShell"",""SmokeShellGreen"",""Chemlight_green"",""HandGrenade"",""HandGrenade"",""30Rnd_65x39_caseless_mag"",""11Rnd_45ACP_Mag"",""11Rnd_45ACP_Mag"",""11Rnd_45ACP_Mag""],[[""hgun_Pistol_heavy_01_F"",""muzzle_snds_acp"","""",""optic_MRD"",[""11Rnd_45ACP_Mag"",11],""""]]],[""B_Carryall_khk"",[""11Rnd_45ACP_Mag"",""11Rnd_45ACP_Mag"",""1Rnd_HE_Grenade_shell"",""1Rnd_HE_Grenade_shell"",""1Rnd_HE_Grenade_shell"",""MiniGrenade"",""MiniGrenade"",""HandGrenade"",""HandGrenade"",""SatchelCharge_Remote_Mag""],[[""arifle_MX_GL_F"","""",""acc_pointer_IR"",""optic_Aco"",[""30Rnd_65x39_caseless_mag"",30],[""1Rnd_HE_Grenade_shell"",1],""""]]]]"
20:33:28 "_contents: [[""FirstAidKit"",1],[""Chemlight_green"",1],[""30Rnd_65x39_caseless_mag"",2]]"
20:33:28 "_contents: [[""SmokeShell"",1],[""SmokeShellGreen"",1],[""Chemlight_green"",1],[""HandGrenade"",2],[""30Rnd_65x39_caseless_mag"",1],[""11Rnd_45ACP_Mag"",4],[""hgun_Pistol_heavy_01_F"",1],[""muzzle_snds_acp"",1],["""",2],[""optic_MRD"",1]]"
20:33:28 "_contents: [[""11Rnd_45ACP_Mag"",2],[""1Rnd_HE_Grenade_shell"",4],[""MiniGrenade"",2],[""HandGrenade"",2],[""SatchelCharge_Remote_Mag"",1],[""arifle_MX_GL_F"",1],["""",2],[""acc_pointer_IR"",1],[""optic_Aco"",1],[""30Rnd_65x39_caseless_mag"",1]]"
20:33:28 "Resulting _contents: [[""FirstAidKit"",1],[""Chemlight_green"",1],[""30Rnd_65x39_caseless_mag"",2],[""SmokeShell"",1],[""SmokeShellGreen"",1],[""Chemlight_green"",1],[""HandGrenade"",2],[""30Rnd_65x39_caseless_mag"",1],[""11Rnd_45ACP_Mag"",4],[""hgun_Pistol_heavy_01_F"",1],[""muzzle_snds_acp"",1],["""",2],[""optic_MRD"",1],[""11Rnd_45ACP_Mag"",2],[""1Rnd_HE_Grenade_shell"",4],[""MiniGrenade"",2],[""HandGrenade"",2],[""SatchelCharge_Remote_Mag"",1],[""arifle_MX_GL_F"",1],["""",2],[""acc_pointer_IR"",1],[""optic_Aco"",1],[""30Rnd_65x39_caseless_mag"",1]]"


    BIS fnc addToPairs
    BIS fnc removeFromPairs
    BIS fnc setToPairs
    BIS fnc findInPairs
    BIS fnc getFromPairs

    _x params[ "_item", "_count" ];
    _text = format[ "%1 - %2", _item, _count ];
    _index = _lb lbAdd _text;
    _lb lbSetValue [ _index, _count ];
    _lb lbSetData [ _index, _item ];
    _pic = switch true do {
        case ( isClass( configFile >> "CfgWeapons" >> _item ) ) : {
            getText( configFile >> "CfgWeapons" >> _item >> "picture" )
        };
        case ( isClass( configFile >> "CfgMagazines" >> _item ) ) : {
            getText( configFile >> "CfgMagazines" >> _item >> "picture" )
        };
        case ( isClass( configFile >> "CfgVehicles" >> _item ) ) : {
            getText( configFile >> "CfgVehicles" >> _item >> "picture" )
        };
        case ( isClass( configFile >> "CfgGlasses" >> _item ) ) : {
            getText( configFile >> "CfgGlasses" >> _item >> "picture" )
        };
    };
    _lb lbSetPicture [ _index, _pic ];



*/