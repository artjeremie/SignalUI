local xbar = CreateFrame("Frame")
xbar:SetScript("OnEvent", function(self, event, ...)
  if event == "ADDON_LOADED" and arg1 == "Blizzard_BindingUI" then
    QuickKeybindFrame.phantomExtraActionButton:ClearAllPoints()
    QuickKeybindFrame.phantomExtraActionButton:SetPoint("RIGHT", -400, -4)
  end
end)
xbar:RegisterEvent("ADDON_LOADED")
xbar:RegisterEvent("PLAYER_LOGIN")