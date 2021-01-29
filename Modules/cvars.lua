local SignalUICVar = CreateFrame("Frame")
SignalUICVar:HookScript("OnEvent", function()
  -- CVars
  SetCVar("ffxglow", 0)
  SetCVar("ffxNether", 0)
  SetCVar("ffxDeath", 0)
  SetCVar("mapFade", 0)
  SetCVar("cameraDistanceMaxZoomFactor", 2.6)
  SetCVar("screenshotQuality", 10)
  SetCVar("SpellQueueWindow", 200)
  SetCVar("showQuestTrackingTooltips", 1)
  SetCVar("showTutorials", 0)
end);

SignalUICVar:RegisterEvent("PLAYER_LOGIN")