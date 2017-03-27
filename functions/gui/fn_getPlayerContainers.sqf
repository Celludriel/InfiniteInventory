private _addToContents = {
    params ["_contents", "_item"];
    if ( isClass (configFile >> "CFGweapons" >> _x)) then {
       //is weapon do nothing will be handled later
    }else{
       if ( isClass (configFile >> "CFGMagazines" >> _x)) then {
           _contents pushBack _x;
       }else{
           _contents pushBack _x;
       };
    };
    _contents
};

//player carried weapons
private _playerWeapons = weaponsItems player;

//Retrieve items
private _uniformItems = [];
{
    _uniformItems = [_uniformItems, _x] call _addToContents;
} forEach uniformItems player;

private _vestItems = [];
{
    _vestItems = [_vestItems, _x] call _addToContents;
} forEach vestItems player;

private _backpackItems = [];
{
    _backpackItems = [_backpackItems, _x] call _addToContents;
} forEach  backpackItems player;

_ret = [
    [
        uniform player,
        _uniformItems,
        []
    ],
    [
        vest player,
        _vestItems,
        []
    ],
    [
        (backpack player) call BIS_fnc_basicBackpack,
        _backpackItems,
        []
    ],
    [
        "playerweapons",
        [],
        _playerWeapons
    ]
];

_ret