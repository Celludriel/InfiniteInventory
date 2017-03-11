diag_log format ["Running Test Inventory: %1", testInventory];

testInventory remoteExecCall ["InfInv_fnc_register", 2];