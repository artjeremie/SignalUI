-- Unitframe class color in hp
local function colorBar(statusbar, unit)
  local _, class, c
  if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
    _, class = UnitClass(unit)
    c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
    statusbar:SetStatusBarColor(c.r, c.g, c.b)
  end
end

hooksecurefunc("UnitFrameHealthBar_Update", colorBar)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
  colorBar(self, self.unit)
end)

-- Unitframe class color names
hooksecurefunc("UnitFrame_Update", function(self)
  if UnitClass(self.unit) then
    local c = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[select(2,UnitClass(self.unit))]
    self.name:SetTextColor(c.r,c.g,c.b,1)
  end
end)

-- Transparent background
local UnitClass = UnitClass

hooksecurefunc("TargetFrame_CheckFaction",function(self)
  local _,class = UnitClass(self.unit)
  self.nameBackground:SetVertexColor(0.0, 0.0, 0.0, 0.5)
end)

-- Rare dragon portrait
-- Ensure chain doesnt clip through pet portrait and rune frame
PetPortrait:GetParent():SetFrameLevel(4)
RuneFrame:SetFrameLevel(4)
PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite.blp")