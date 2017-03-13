//Retrieve items
private _cfgWeapons = configFile >> "CfgWeapons";
private _validItems = ["ItemCore", "DetectorCore"];

private _itemIsValid = {
	private _r = {
		_this isKindOf [_x, _cfgWeapons]
	} count _validItems;
	_r > 0
};

private _uniformItems = [];
{
	if(_x call _itemIsValid) then {
		_uniformItems pushBack _x;
	};
} forEach uniformItems player;

private _vestItems = [];
{
	if(_x call _itemIsValid) then {
		_vestItems pushBack _x;
	};
} forEach vestItems player;

private _backpackItems = [];
{
	if(_x call _itemIsValid) then {
		_backpackItems pushBack _x;
	};
} forEach  backpackItems player;

//Retreieve mags in inventory only
private _uniformMags = [];
private _vestMags = [];
private _backpackMags = [];

{
	_x params [
		"_class",
		"_ammo",
		"_loaded",
		"_type",
		"_location"
	];

	switch(_location) do {
		case "Uniform": {
			_uniformMags pushBack [_class, _ammo];
		};
		case "Vest": {
			_vestMags pushBack [_class, _ammo];
		};
		case "Backpack": {
			_backpackMags pushBack [_class, _ammo];
		};
	};
} forEach magazinesAmmoFull player;

//Retrieve weapons in uniform vest and backpack
private _uniformContainer =  uniformContainer player;
private _uniformWeapons = if(!isNull _uniformContainer) then { weaponsItems _uniformContainer } else { [] };
private _vestContainer =  vestContainer player;
private _vestWeapons = if(!isNull _vestContainer) then { weaponsItems _vestContainer } else { [] };
private _backpackContainer =  backpackContainer player;
private _backpackWeapons = if(!isNull _backpackContainer) then { weaponsItems _backpackContainer } else { [] };

//Retrieve weapons and loaded mags
private _carriedWeapons = [];
_carriedWeapons append _uniformWeapons;
_carriedWeapons append _vestWeapons;
_carriedWeapons append _backpackWeapons;

_ret = [
	[
		[
			uniform player,
			_uniformItems,
			_uniformMags,
			_uniformWeapons
		],
		[
			vest player,
			_vestItems,
			_vestMags,
			_vestWeapons
		],
		[
			(backpack player) call BIS_fnc_basicBackpack,
			_backpackItems,
			_backpackMags,
			_backpackWeapons
		]
	]
];

_ret