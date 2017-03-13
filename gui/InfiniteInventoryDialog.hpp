class INFINV_Dialog {
	idd = 1900;
	movingEnable = false;
	enableSimulation = 1;	
	onLoad = "[] call InfInv_fnc_loadEquipmentContainer";
	onUnload = "";
	controlsBackground[] = { "InfiniteInventoryFrame", "InventoryFilter", "InventoryFilter", "EquipmentFilter",
	"InventoryContainer", "EquipmentContainer", "AddSingleItemButton", "TakeSingleItemButton", "TakeAllButton" };
	
	#include "InfiniteInventoryGui.hpp" 
};