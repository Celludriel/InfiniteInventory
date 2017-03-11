params ["_container"];

private ["_ok"];

diag_log format ["Opening container: %1", _container];

_ok = createDialog "INFINV_Dialog";
if (!_ok) then {hint "Dialog couldn't be opened!"};