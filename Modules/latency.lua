sLatency = CreateFrame("Frame", "StatsFrame", UIParent)
sLatency:ClearAllPoints()
sLatency:SetPoint('BOTTOMRIGHT', UIParent, "BOTTOMRIGHT", 0, 45)

local sStatus = CreateFrame("Frame")
sStatus:RegisterEvent("PLAYER_LOGIN")
sStatus:SetScript("OnEvent", function(self, event)

  local color
  if customColor == false then
    color = {r = 1, g = 1, b = 1}
  else
    local _, class = UnitClass("player")
    color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
  end

  local function statusFps()
    return "|c00ffffff" .. floor(GetFramerate()) .. "|r fps"
  end

  local function statusLatency()
    return "|c00ffffff" .. select(3, GetNetStats()) .. "|r ms"
  end

  sLatency:SetWidth(50)
  sLatency:SetHeight(14)
  sLatency.text = sLatency:CreateFontString(nil, "BACKGROUND")
  sLatency.text:SetPoint("CENTER", sLatency)
  sLatency.text:SetFont("FONTS\\FRIZQT__.TTF", 11, "OUTLINE")
  sLatency.text:SetTextColor(color.r, color.g, color.b)

  local lastUpdate = 0

  local function update(self, elapsed)
    lastUpdate = lastUpdate + elapsed
    if lastUpdate > 1 then
      lastUpdate = 0
      if showClock == true then
        sLatency.text:SetText(statusFps() .. " " .. statusLatency())
      else
        sLatency.text:SetText(statusFps() .. " " .. statusLatency())
      end
      self:SetWidth(sLatency.text:GetStringWidth())
      self:SetHeight(sLatency.text:GetStringHeight())
    end
  end

  sLatency:SetScript("OnUpdate", update)
end)