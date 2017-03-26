params ["_container"];

private ["_ok"];

diag_log format ["Opening container: %1", _container];

INFINV_CURRENT_CONTAINER = _container;

_ok = createDialog "INFINV_Dialog";
if (!_ok) then {hint "Dialog couldn't be opened!"};

INFINV_CURRENT_CONTAINER setVariable ["NeedsRefresh", true];

[] spawn {
  disableSerialization;
  while { dialog } do {
    sleep 0.5;
    _needsRefresh = INFINV_CURRENT_CONTAINER getVariable ["NeedsRefresh", false];
    if(_needsRefresh) then {
        [] call InfInv_fnc_loadEquipmentContainer;
        [] call InfInv_fnc_loadInventoryContainerData;
        [true] call InfInv_fnc_toggleControls;
        INFINV_CURRENT_CONTAINER setVariable ["NeedsRefresh", false];
    };
  };
};
