_playerContainerGear = [] call InfInv_fnc_getPlayerContainerGear;

diag_log format ["_playerContainerGear: %1", _playerContainerGear];

/*
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


[
	[
		[""U_B_CombatUniform_mcam"",[""FirstAidKit""],[[""30Rnd_65x39_caseless_mag"",30],[""30Rnd_65x39_caseless_mag"",30]],[]],
		[""V_PlateCarrier1_rgr"",[],[[""Chemlight_green"",1],[""HandGrenade"",1],[""30Rnd_65x39_caseless_mag"",30],[""11Rnd_45ACP_Mag"",11],[""11Rnd_45ACP_Mag"",11],[""11Rnd_45ACP_Mag"",11]],[]],
		[""B_Carryall_khk"",[""Medikit""],[[""RPG7_F"",1],[""RPG7_F"",1],[""11Rnd_45ACP_Mag"",11],[""11Rnd_45ACP_Mag"",11],[""1Rnd_HE_Grenade_shell"",1],[""1Rnd_HE_Grenade_shell"",1],[""1Rnd_HE_Grenade_shell"",1],[""MiniGrenade"",1],[""HandGrenade"",1],[""HandGrenade"",1],[""SatchelCharge_Remote_Mag"",1]],[]]
	]
]
*/