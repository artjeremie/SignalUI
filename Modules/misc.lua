local sMisc = CreateFrame("Frame")
sMisc:RegisterEvent("PLAYER_LOGIN")
sMisc:SetScript("OnEvent", function(self, event)

-- Welcome message
  print("Welcome to |cff00ff00Signal|r|cff009cffUI|r use |CFFFAC025/sl|r for grids & |CFFFAC025/sr|r to reload.")

-- Slash commands
-- Reload
  SLASH_SignalUIReload1 = "/sr"
  SLASH_SignalUIReload2 = "/srl"
  SlashCmdList["SignalUIReload"] = ReloadUI

-- Leave group
  SLASH_LEAVEGROUP1 = "/lg"
  SlashCmdList["LEAVEGROUP"] = function()
    SendChatMessage("Thanks for the Group","SAY")
    C_PartyInfo.LeaveParty()
  end

-- Random mount
  SLASH_RANDOMMOUNT1 = "/rm"
  SlashCmdList["RANDOMMOUNT"] = function()
    C_MountJournal.SummonByID(0)
  end

-- Stopwatch
Stopwatch_Toggle()
StopwatchFrame:SetFrameStrata(BACKGROUND)
end)

-- Damage font
DAMAGE_TEXT_FONT = "Interface\\AddOns\\SignalUI\\Media\\font.ttf"