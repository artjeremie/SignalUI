local targeting = ""
local TARGET_PREFIX = TARGET..":|cffffffff ";

local STT = {}

-- hook the game tool tip updates, this ensures when a mouseover targets target changes
-- the tooltip will update
GameTooltip:HookScript("OnUpdate", function(self, ...)
  STT:AddTargetToTT()
end)

function STT:AddTargetToTT()

  if ( not UnitExists('mouseovertarget')) then return end
  -- look for the existing line that starts with "TARGET"
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

  targeting = UnitName("mouseovertarget")

  -- modify if they are targeting you
  if targeting == UnitName("player") then
    targeting = "<YOU>"
  end

  if (targeting ~= nil and targeting ~= "") then
    -- either use the existing line and set it's text, or add the new line of text
    if useExisting then
      targetLine:SetText(string.format("%s %s |r", TARGET_PREFIX, targeting ) )
    else
      GameTooltip:AddLine( string.format("%s %s |r", TARGET_PREFIX, targeting ) )
    end

    GameTooltip:Show()
  end
end