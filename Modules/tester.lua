--QuickKeybindFramephantomExtraActionButton:Hide()

--MultiBarBottomLeftButton8:ClearAllPoints()
--MultiBarBottomLeftButton8:SetAllPoints("LEFT", ActionButton12, "RIGHT", 6, 0)

local xbar = CreateFrame("Frame")
xbar:RegisterEvent("ADDON_LOADED")
xbar:SetScript("OnEvent", function()
  if event == "ADDON_LOADED" and arg1 == "Blizzard_BindingUI" then
    QuickKeybindFrame.phantomExtraActionButton:ClearAllPoints()
    QuickKeybindFrame.phantomExtraActionButton:SetPoint("TOPLEFT", -400, -440)
    QuickKeybindFrame.phantomExtraActionButton:SetPoint("BOTTOMRIGHT", -400, -440)
  end
end)