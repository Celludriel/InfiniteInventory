if(!isServer) exitWith {};

params ["_container"];

_container setVariable ["INFINV_CONTENTS", []];

[_container, ["InventoryOpened", { _this call INFINV_gui_fnc_openInventory; true }]] remoteExec ["addEventHandler", 0, true];