diag_log format ["Running Test Inventory: %1", testInventory];

[testInventory, [["FirstAidKit",10]]] remoteExecCall ["InfInv_fnc_register", 2];