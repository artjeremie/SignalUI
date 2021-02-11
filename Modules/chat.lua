-- Enable arrow keys for normal and existing chat frames
for i = 1, 50 do
  if _G["ChatFrame" .. i] then
    _G["ChatFrame" .. i .. "EditBox"]:SetAltArrowKeyMode(false)
  end
end

-- Lets make it short
CHAT_SAY_GET = "[S] %s: "
CHAT_YELL_GET = "[Y] %s: "
CHAT_WHISPER_GET = "[F] %s: "
CHAT_WHISPER_INFORM_GET = "[T] %s: "

CHAT_FLAG_AFK = "[AFK] "
CHAT_FLAG_DND = "[DND] "
CHAT_FLAG_GM = "[GM] "

CHAT_MONSTER_PARTY_GET = CHAT_PARTY_GET
CHAT_MONSTER_SAY_GET = CHAT_SAY_GET
CHAT_MONSTER_WHISPER_GET = CHAT_WHISPER_GET
CHAT_MONSTER_YELL_GET = CHAT_YELL_GET

local gsub = gsub
local time = _G.time
local newAddMsg = {}

local rplc = {
  "[GEN]", --General
  "[T]",   --Trade
  "[WD]",  --WorldDefense
  "[LD]",  --LocalDefense
  "[LFG]", --LookingForGroup
  "[GR]",  --GuildRecruitment
  "[I]",   --Instance
  "[IL]",  --Instance Leader
  "[G]",   --Guild
  "[P]",   --Party
  "[PL]",  --Party Leader
  "[PL]",  --Party Leader (Guide)
  "[O]",   --Officer
  "[R]",   --Raid
  "[RL]",  --Raid Leader
  "[RW]",  --Raid Warning
  "[%1]",  --Custom Channels
}

local chn = {
  "%[%d0?%. General.-%]",
  "%[%d0?%. Trade.-%]",
  "%[%d0?%. WorldDefense%]",
  "%[%d0?%. LocalDefense.-%]",
  "%[%d0?%. LookingForGroup%]",
  "%[%d0?%. GuildRecruitment.-%]",
  gsub(CHAT_INSTANCE_CHAT_GET, ".*%[(.*)%].*", "%%[%1%%]"),
  gsub(CHAT_INSTANCE_CHAT_LEADER_GET, ".*%[(.*)%].*", "%%[%1%%]"),
  gsub(CHAT_GUILD_GET, ".*%[(.*)%].*", "%%[%1%%]"),
  gsub(CHAT_PARTY_GET, ".*%[(.*)%].*", "%%[%1%%]"),
  gsub(CHAT_PARTY_LEADER_GET, ".*%[(.*)%].*", "%%[%1%%]"),
  gsub(CHAT_PARTY_GUIDE_GET, ".*%[(.*)%].*", "%%[%1%%]"),
  gsub(CHAT_OFFICER_GET, ".*%[(.*)%].*", "%%[%1%%]"),
  gsub(CHAT_RAID_GET, ".*%[(.*)%].*", "%%[%1%%]"),
  gsub(CHAT_RAID_LEADER_GET, ".*%[(.*)%].*", "%%[%1%%]"),
  gsub(CHAT_RAID_WARNING_GET, ".*%[(.*)%].*", "%%[%1%%]"),
  -- Custom channels
  "%[(%d0?)%. (.-)%]",
}

local AddMessage = function(frame, text, ...)
  for i = 1, 17 do
    text = gsub(text, chn[i], rplc[i])
  end
  -- custom channles
  text = gsub(text, "%[(%d0?)%. .-%]", "[%1]")
  return newAddMsg[frame:GetName()](frame, text, ...)
end
for i = 1, 10 do
  local fcl = _G[format("%s%d", "ChatFrame", i)]
  --skip combatlog and frames with no messages registered
  if i ~= 2 then
    newAddMsg[format("%s%d", "ChatFrame", i)] = fcl.AddMessage
    fcl.AddMessage = AddMessage
  end
end

-- Chat fade hide
CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0
CHAT_FRAME_BUTTON_FRAME_MIN_ALPHA = 0
for i=1, 10 do
  local tab = _G[format("%s%d%s", "ChatFrame", i, "Tab")]
  tab:SetAlpha(0)
  tab.noMouseAlpha = 0
end

-- Tab flashing
FCF_FlashTab = function() end
FCFTab_UpdateAlpha = function() end

-- Resize and move to end of screen
for i = 1, 10 do
  local eb =  _G[format("%s%d%s", "ChatFrame", i, "EditBox")]
  local cfs = _G[format("%s%d", "ChatFrame", i)]
  cfs:SetMinResize(100,10)
  cfs:SetMaxResize(0,0)
  cfs:SetClampRectInsets(0,0,0,0)
  eb:SetAltArrowKeyMode(false)
end

-- Chat scrollbar hide
for i=1,NUM_CHAT_WINDOWS do 
  local f="ChatFrame" .. i;
  local b = _G["ChatFrame"..i].ScrollBar b:UnregisterAllEvents()
  b:SetScript("OnShow", b.Hide)
  b:Hide();
end

-- Chat editbox
ChatFrame1EditBox:ClearAllPoints()
ChatFrame1EditBox:SetPoint("BOTTOMLEFT", ChatFrame1, "TOPLEFT", -5, 2)
ChatFrame1EditBox:SetPoint("RIGHT", ChatFrame1, 5, 0)

-- Normal scroll
local function scrollChat(sMWChat, delta)
  if delta > 0 then
    sMWChat:ScrollUp()
  elseif delta < 0 then
    sMWChat:ScrollDown()
  end
end