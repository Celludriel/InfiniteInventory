if(!isServer || hasInterface) exitWith {};

params ["_container"];

diag_log format ["Registering container: %1", _container];

_container setVariable ["INFINV_CONTENTS", []];

[_container, ["Open", { _this call InfInv_fnc_openInventory; true }]] remoteExec ["addAction", 0, true];