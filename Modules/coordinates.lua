local coords = CreateFrame("Frame", nil, Minimap)
coords:SetFrameLevel(Minimap:GetFrameLevel() + 5)
coords:SetAllPoints()
coords.elapsed = 0

coords.msg = coords:CreateFontString()
coords.msg:SetDrawLayer("OVERLAY")
--coords.msg:SetFontObject(GameFontNormal)
coords.msg:SetFont("FONTS\\FRIZQT__.TTF", 11, "OUTLINE")
coords.msg:SetPoint("TOP", 0, -15)
coords.msg:SetTextColor(0,51,0)

coords.onUpdate = function(self, elapsed)
  self.elapsed = self.elapsed + elapsed
  if self.elapsed < .5 then
    return
  end

  local x, y
  local mapID = C_Map.GetBestMapForUnit("player")
  if mapID then
    -- you don't get coordinates in instances
    local mapPosObject = C_Map.GetPlayerMapPosition(mapID, "player")
    if mapPosObject then
      x, y = mapPosObject:GetXY()
    end
  end

  -- just to avoid checking for nil entries and stuff
  x = x or 0
  y = y or 0

  -- hide it when there aren't any coordinates
  self.msg:SetShown(x + y > 0)
  self.msg:SetFormattedText("%.1f %.1f", x*100, y*100)

  self.elapsed = 0
end

coords:SetScript("OnEvent", function(self)
  self:SetScript("OnUpdate", self.onUpdate)
end)
coords:RegisterEvent("PLAYER_ENTERING_WORLD")