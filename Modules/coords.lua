local sCoords = CreateFrame("Frame", "CoordsFrame", UIParent)
sCoords:ClearAllPoints()
sCoords:SetAllPoints()
sCoords.elapsed = 0

sCoords.msg = sCoords:CreateFontString()
sCoords.msg:SetFont("FONTS\\FRIZQT__.TTF", 11, "OUTLINE")
sCoords.msg:SetPoint('TOPRIGHT', UIParent, "TOPRIGHT", -65, -22)
sCoords.msg:SetTextColor(255,205,0)

sCoords.onUpdate = function(self, elapsed)
  self.elapsed = self.elapsed + elapsed

  if self.elapsed < .9 then
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

sCoords:SetScript("OnEvent", function(self)
  self:SetScript("OnUpdate", self.onUpdate)
end)
sCoords:RegisterEvent("PLAYER_ENTERING_WORLD")