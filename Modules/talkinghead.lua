local function NoTalkingHeads()
  hooksecurefunc(TalkingHeadFrame, "Show", function(self) self:Hide() end)
end

if IsAddOnLoaded("Blizzard_TalkingHeadUI") then NoTalkingHeads()
else
  local waitFrame = CreateFrame("FRAME")
  waitFrame:RegisterEvent("ADDON_LOADED")
  waitFrame:SetScript("OnEvent", function(self, event, arg1)
    if arg1 == "Blizzard_TalkingHeadUI" then
      NoTalkingHeads()
      waitFrame:UnregisterAllEvents()
    end
  end)
end