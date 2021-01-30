-- Macros and hotkeys
for i=1, 12 do

  -- main bar
  _G["ActionButton"..i.."Name"]:SetAlpha(0)
  _G["ActionButton"..i.."HotKey"]:SetAlpha(0)

  -- bottom left bar
  _G["MultiBarBottomLeftButton"..i.."Name"]:SetAlpha(0)
  _G["MultiBarBottomLeftButton"..i.."HotKey"]:SetAlpha(0)

  -- right bar
  _G["MultiBarRightButton"..i.."Name"]:SetAlpha(0)
  _G["MultiBarRightButton"..i.."HotKey"]:SetAlpha(0)

  -- right bar 2
  _G["MultiBarLeftButton"..i.."Name"]:SetAlpha(0)
  _G["MultiBarLeftButton"..i.."HotKey"]:SetAlpha(0)
end

-- Move right button to main bar
MultiBarLeftButton12:SetScale(1.1)
MultiBarRightButton12:SetScale(1.1)
MultiBarLeftButton12:ClearAllPoints()
MultiBarLeftButton12:SetPoint("LEFT", MultiBarBottomLeftButton12, "RIGHT", 6, 0)
MultiBarRightButton12:ClearAllPoints()
MultiBarRightButton12:SetPoint("LEFT", ActionButton12, "RIGHT", 6, 0)
ActionBarDownButton:ClearAllPoints()
ActionBarUpButton:ClearAllPoints()
ActionBarUpButton:SetPoint("BOTTOM", MultiBarRightButton12, "RIGHT", 14,-1)
ActionBarDownButton:SetPoint("TOP", MultiBarRightButton12, "RIGHT", 14,-1)

-- Pet action bar
PetActionButton1:ClearAllPoints()
PetActionButton1:SetPoint("CENTER", ActionButton1, "CENTER", -3, 91)
PetActionButton2:ClearAllPoints()
PetActionButton2:SetPoint("CENTER", PetActionButton1, "CENTER", 34, 0)
PetActionButton3:ClearAllPoints()
PetActionButton3:SetPoint("CENTER", PetActionButton2, "CENTER", 34, 0)
PetActionButton4:ClearAllPoints()
PetActionButton4:SetPoint("CENTER", PetActionButton3, "CENTER", 34, 0)
PetActionButton5:ClearAllPoints()
PetActionButton5:SetPoint("CENTER", PetActionButton4, "CENTER", 34, 0)
PetActionButton6:ClearAllPoints()
PetActionButton6:SetPoint("CENTER", PetActionButton5, "CENTER", 34, 0)
PetActionButton7:ClearAllPoints()
PetActionButton7:SetPoint("CENTER", PetActionButton6, "CENTER", 34, 0)
PetActionButton8:ClearAllPoints()
PetActionButton8:SetPoint("CENTER", PetActionButton7, "CENTER", 34, 0)
PetActionButton9:ClearAllPoints()
PetActionButton9:SetPoint("CENTER", PetActionButton8, "CENTER", 34, 0)
PetActionButton10:ClearAllPoints()
PetActionButton10:SetPoint("CENTER", PetActionButton9, "CENTER", 34, 0)

-- Disable auto add spell in action bar
IconIntroTracker.RegisterEvent = function() end
IconIntroTracker:UnregisterEvent('SPELL_PUSHED_TO_ACTIONBAR')