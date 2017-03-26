#define addFunction(fncName)		class fncName { headerType = -1; }
#define addFunctionPre(fncName)		class fncName { headerType = -1; preInit = 1; }
#define addFunctionPost(fncName)	class fncName { headerType = -1; postInit = 1; }

class InfInv {
	class client {
		file = "functions\gui";

		addFunction(addItemToContainer);
		addFunction(takeItemFromContainer);
		addFunction(addAllItemsToContainer);
		addFunction(filterContainer);
		addFunction(filterEquipment);
		addFunction(openInventory);
		addFunction(getPlayerContainers);
		addFunction(getContentsFromPlayerContainer);
		addFunction(loadListBoxFromData);
		addFunction(loadEquipmentContainer);
		addFunction(loadInventoryContainerData);
		addFunction(loadInventoryContainer);
		addFunction(toggleControls);
		addFunction(showError);
	};

	class server {
		file = "functions\server";

		addFunction(register);
		addFunction(getContainerContents);
		addFunction(takeFromContainerContents);
	};
};