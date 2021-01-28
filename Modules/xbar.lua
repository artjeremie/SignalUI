local xbar = CreateFrame("Frame")
xbar:RegisterEvent("ADDON_LOADED")
xbar:RegisterEvent("PLAYER_LOGIN")
xbar:SetScript("OnEvent", function()
  if event == "ADDON_LOADED" and arg1 == "Blizzard_BindingUI" then
    QuickKeybindFrame.phantomExtraActionButton:ClearAllPoints()
    QuickKeybindFrame.phantomExtraActionButton:SetPoint("RIGHT", -4, -4)
  end
end)