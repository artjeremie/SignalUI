-- Loot won roll toast
local sLootAlert = AlertFrame;
sLootAlert:UnregisterEvent("LOOT_ITEM_ROLL_WON")
sLootAlert:UnregisterEvent("SHOW_LOOT_TOAST")

-- UI text errors
UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")