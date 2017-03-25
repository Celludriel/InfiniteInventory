 params ["_listBox", "_contents"];

lbClear _listBox;

{
    _x params[ "_item", "_count" ];

    diag_log format ["Adding _item with _count: %1, %2", _item, _count];

    _displayName = switch true do {
             case ( isClass( configFile >> "CfgWeapons" >> _item ) ) : {
                 getText( configFile >> "CfgWeapons" >> _item >> "displayName" )
             };
             case ( isClass( configFile >> "CfgMagazines" >> _item ) ) : {
                 getText( configFile >> "CfgMagazines" >> _item >> "displayName" )
             };
             case ( isClass( configFile >> "CfgVehicles" >> _item ) ) : {
                 getText( configFile >> "CfgVehicles" >> _item >> "displayName" )
             };
             case ( isClass( configFile >> "CfgGlasses" >> _item ) ) : {
                 getText( configFile >> "CfgGlasses" >> _item >> "displayName" )
             };
         };

    _text = format[ "%1 - %2", _displayName, _count ];
    _index = _listBox lbAdd _text;
    _listBox lbSetValue [ _index, _count ];
    _listBox lbSetData [ _index, _item ];

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
    _listBox lbSetPicture [ _index, _pic ];
} forEach _contents;