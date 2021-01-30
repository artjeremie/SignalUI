local sTarget = ""
local TARGET_PREFIX = TARGET..":|cffffffff ";

local sTT = {}

-- hook the game tool tip updates, this ensures when a mouseover targets target changes
-- the tooltip will update
GameTooltip:HookScript("OnUpdate", function(self, ...)
  sTT:AddTargetToTT()
end)

function sTT:AddTargetToTT()

  if ( not UnitExists('mouseovertarget')) then
    return
  end

  local targetLine
  local useExisting = false

  for i = 2, GameTooltip:NumLines() do
    targetLine = _G["GameTooltipTextLeft"..i];
    if (targetLine:GetText():find(TARGET)) then
      -- if we find it, we'll use it later instead of adding a new line
      useExisting = true
      break;
    end
  end

  sTarget = UnitName("mouseovertarget")

  -- modify if they are targeting you
  if sTarget == UnitName("player") then
    sTarget = "<YOU>"
  end

  if (sTarget ~= nil and sTarget ~= "") then
    -- either use the existing line and set it's text, or add the new line of text
    if useExisting then
      targetLine:SetText(string.format("%s %s |r", TARGET_PREFIX, sTarget ) )
    else
      GameTooltip:AddLine( string.format("%s %s |r", TARGET_PREFIX, sTarget ) )
    end

    GameTooltip:Show()
  end
end

-- Move tooltip
hooksecurefunc("GameTooltip_SetDefaultAnchor", function()
  if GameTooltip then
    GameTooltip:ClearAllPoints()
    GameTooltip:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -85, 50)
  end
end)