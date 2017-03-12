if(!isServer || hasInterface) exitWith {};

params ["_container"];

diag_log format ["Registering container: %1", _container];

_container setVariable ["INFINV_CONTENTS", []];

_inventoryOverrideFunction = {
    diag_log format ["Overriding container opening for: %1", _this];
    player setVariable ["InfInvActiveContainer", _this];

    _openHandlerFunction = {
        _container = player getVariable "InfInvActiveContainer";
        diag_log format ["Overriding open inventory for: %1", _container];
        _container call InfInv_fnc_openInventory;
        true
    };

    _closeHandlerFunction = {
        diag_log format ["Overriding closing inventory"];
        _openHandler = player getVariable "InfInvOpenHandler";
        _closeHandler = player getVariable "InfInvCloseHandler";
        player setVariable ["InfInvOpenHandler", nil];
        player setVariable ["InfInvCloseHandler", nil];
        player setVariable ["InfInvActiveContainer", nil];

        diag_log format ["Removing eventhandlers %1, %2", _openHandler, _closeHandler];
        player removeEventHandler(_openHandler);
        player removeEventHandler(_closeHandler);
    };

    _openHandler = player addEventHandler ["InventoryOpened", _openHandlerFunction];
    _closeHandler = player addEventHandler ["InventoryClosed", _closeHandlerFunction];

    diag_log format ["Adding eventhandlers %1, %2", _openHandler, _closeHandler];
    player setVariable ["InfInvOpenHandler", _openHandler];
    player setVariable ["InfInvCloseHandler", _closeHandler];

};

[_container, ["ContainerOpened", _inventoryOverrideFunction]] remoteExec ["addEventHandler", 0, true];