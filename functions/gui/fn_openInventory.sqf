params ["_container"];

private ["_ok", "_display", "_lb"];

INFINV_CURRENT_CONTAINER = _container;

_ok = createDialog "INFINV_Dialog";
if (!_ok) then {hint "Dialog couldn't be opened!"};

//Load inventory combobox
_display = findDisplay 1900;
_lb = _display displayCtrl 2101;
[_lb] call InfInv_fnc_loadFilterData;

//Load equipment combobox
_lb = _display displayCtrl 2100;
[_lb] call InfInv_fnc_loadFilterData;

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
