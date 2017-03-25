class INFINV_Dialog {
	idd = 1900;
	movingEnable = false;
	enableSimulation = 1;	
	onLoad = "[_this select 0] call InfInv_fnc_loadDialogContents";
	onUnload = "";
	controlsBackground[] = { "InfiniteInventoryFrame", "InventoryFilter", "InventoryFilter", "EquipmentFilter",
	"InventoryContainer", "EquipmentContainer", "AddSingleItemButton", "TakeSingleItemButton", "TakeAllButton" };
	
	#include "InfiniteInventoryGui.hpp" 
};