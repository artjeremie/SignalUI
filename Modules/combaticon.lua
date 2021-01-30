local sCombat = CreateFrame("Frame")
sCombat:RegisterEvent("PLAYER_LOGIN")
sCombat:SetScript("OnEvent", function(self, event)

  sct = CreateFrame("Frame")
  sct:SetPoint("Right", TargetFrame, 0)
  sct:SetSize(30, 30)
  sct.t = sct:CreateTexture(nil, BORDER)
  sct.t:SetAllPoints()
  sct.t:SetTexture("Interface\\Icons\\ABILITY_DUALWIELD")
  sct:Hide()

  local function FrameOnUpdate(self)
    if UnitAffectingCombat("target") then
      self:Show()
    else
      self:Hide()
    end
  end

  local ci = CreateFrame("Frame")
  ci:SetScript("OnUpdate", function(self)
    FrameOnUpdate(sct)
  end)

  sft = CreateFrame("Frame")
  sft:SetPoint("Right", FocusFrame, 0)
  sft:SetSize(30, 30)
  sft.t = sft:CreateTexture(nil, BORDER)
  sft.t:SetAllPoints()
  sft.t:SetTexture("Interface\\Icons\\ABILITY_DUALWIELD")
  sft:Hide()

  local function FrameOnUpdate(self)
    if UnitAffectingCombat("focus") then
      self:Show()
    else
      self:Hide()
    end
  end

  local ci = CreateFrame("Frame")
  ci:SetScript("OnUpdate", function(self)
    FrameOnUpdate(sft)
  end)
end)