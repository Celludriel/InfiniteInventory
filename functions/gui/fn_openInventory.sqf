params ["_container"];

private ["_ok"];

_ok = createDialog "RscDisplayGame";
if (!_ok) then {hint "Dialog couldn't be opened!"};