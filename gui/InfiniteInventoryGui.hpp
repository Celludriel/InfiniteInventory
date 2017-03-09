////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Celludriel, v1.063, #Femuby)
////////////////////////////////////////////////////////

class InfiniteInventoryFrame: RscFrame
{
	idc = 1800;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 25 * GUI_GRID_H;
};
class InventoryFilter: RscCombo
{
	idc = 2100;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Filter Items"; //--- ToDo: Localize;
    onLBSelChanged = "[] call 'INFINV_gui_fnc_filterContainer'; false";
};
class EquipmentFilter: RscCombo
{
	idc = 2101;
	x = 26 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Filter items"; //--- ToDo: Localize;
    onLBSelChanged = "[] call 'INFINV_gui_fnc_filterEquipment'; false";
};
class InventoryContainer: RscListbox
{
	idc = 1500;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 22.5 * GUI_GRID_H;
};
class EquipmentContainer: RscListbox
{
	idc = 1501;
	x = 26 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 22.5 * GUI_GRID_H;
};
class AddSingleItemButton: RscButton
{
	idc = 1600;
	text = "<"; //--- ToDo: Localize;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	tooltip = "Add"; //--- ToDo: Localize;
	action = "[] call 'INFINV_gui_fnc_addItemToContainer';";
};
class TakeSingleItemButton: RscButton
{
	idc = 1601;
	text = ">"; //--- ToDo: Localize;
	x = 20 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	tooltip = "Take"; //--- ToDo: Localize;
	action = "[] call 'INFINV_gui_fnc_takeItemFromContainer';";
};
class TakeAllButton: RscButton
{
	idc = 1602;
	text = "<<<"; //--- ToDo: Localize;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	tooltip = "Add all"; //--- ToDo: Localize;
    action = "[] call 'INFINV_gui_fnc_addAllItemsToContainer';";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
