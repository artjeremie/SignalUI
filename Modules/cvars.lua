local SCVar = CreateFrame("Frame")
SCVar:HookScript("OnEvent", function()
  SetCVar("ffxglow", 0)
  SetCVar("ffxNether", 0)
  SetCVar("ffxDeath", 0)
  SetCVar("mapFade", 0)
  SetCVar("screenshotQuality", 10)
  SetCVar("SpellQueueWindow", 200)
  SetCVar("AllowDangerousScripts", 1)
  SetCVar("showQuestTrackingTooltips", 1)
end)

SCVar:RegisterEvent("PLAYER_LOGIN")