local function HookTalkingHead()
end

if TalkingHeadFrame then
  HookTalkingHead()
else
  hooksecurefunc('TalkingHead_LoadUI', HookTalkingHead)
end