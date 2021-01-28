-- Slash commands
SlashCmdList["RELOAD_RELOADUI"] = function()
  Reload_ReloadUI();
end
SLASH_RELOAD_RELOADUI1 = "/reload";
SLASH_RELOAD_RELOADUI2 = "/reloadui";
SLASH_RELOAD_RELOADUI3 = "/sr";

function Reload_ReloadUI()
  ReloadUI();
end

-- Move debuff
hooksecurefunc("BuffFrame_UpdateAllBuffAnchors", function()
  if DebuffButton1 then
    DebuffButton1:ClearAllPoints()
    DebuffButton1:SetPoint("TOP", UIParent, "TOPLEFT", 500, -255)
  end
end)

-- Stopwatch
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
  print("Welcome to |cff00ff00Signal|r|cff009cffUI|r use |CFFFAC025/sl|r for grids & |CFFFAC025/sr|r to reload.")
  Stopwatch_Toggle()
  StopwatchFrame:SetFrameStrata(BACKGROUND)
end)

-- Raid frames slider extender
local n,w,h="CompactUnitFrameProfilesGeneralOptionsFrame" h,w=
_G[n.."HeightSlider"],
_G[n.."WidthSlider"]
h:SetMinMaxValues(1,150)
w:SetMinMaxValues(1,150)

-- Always on bottom party frame
LoadAddOn("Blizzard_CompactRaidFrames") CRFSort_Group=function(t1, t2) if UnitIsUnit(t1,"player") then return false elseif UnitIsUnit(t2,"player") then return true else return t1 < t2 end end CompactRaidFrameContainer.flowSortFunc=CRFSort_Group

-- Move tooltip
hooksecurefunc("GameTooltip_SetDefaultAnchor", function()
  if GameTooltip then
    GameTooltip:ClearAllPoints()
    GameTooltip:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -85, 50)
  end
end)

-- Disable auto add spell in action bar
IconIntroTracker.RegisterEvent = function() end
IconIntroTracker:UnregisterEvent('SPELL_PUSHED_TO_ACTIONBAR')

-- Hide alert loot/achievement frame
--hooksecurefunc(AlertFrame, "RegisterEvent", function(self, event)
--  AlertFrame:UnregisterEvent(event)
--end)
--AlertFrame:UnregisterAllEvents()

-- Ensure chain doesnt clip through pet portrait and rune frame
PetPortrait:GetParent():SetFrameLevel(4)
RuneFrame:SetFrameLevel(4)
PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite.blp");

-- Enable arrow keys for normal and existing chat frames
--for i = 1, 50 do
--  if _G["ChatFrame" .. i] then
--    _G["ChatFrame" .. i .. "EditBox"]:SetAltArrowKeyMode(false)
--  end
--end