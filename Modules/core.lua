-- Hide error frame
UIErrorsFrame:Hide()
-- Hide pvp icon
PlayerPrestigeBadge:SetAlpha(0)
PlayerPrestigePortrait:SetAlpha(0)
TargetFrameTextureFramePrestigeBadge:SetAlpha(0)
TargetFrameTextureFramePrestigePortrait:SetAlpha(0)
FocusFrameTextureFramePrestigeBadge:SetAlpha(0)
FocusFrameTextureFramePrestigePortrait:SetAlpha(0)
-- Hides gryphons
MainMenuBarArtFrame.LeftEndCap:Hide()
MainMenuBarArtFrame.RightEndCap:Hide()
-- Hides xpbar
--StatusTrackingBarManager:SetAlpha(0)
--MainMenuBarArtFrameBackground:SetPoint("BOTTOM", UIParent)
-- Hides actionbar page number
MainMenuBarArtFrame.PageNumber:Hide()
-- Hides actionbar background
MainMenuBarArtFrameBackground.BackgroundSmall:SetAlpha(0)
MainMenuBarArtFrameBackground.BackgroundLarge:SetAlpha(0)
-- Disable auto adjusting frames
for k, v in next, UIPARENT_MANAGED_FRAME_POSITIONS do
	v.extraAbilityContainer = nil
end
-- Extra action button
--ExtraAbilityContainer:ClearAllPoints()
--ExtraAbilityContainer:SetPoint("CENTER", 0, 0)
ExtraActionButton1:ClearAllPoints()
ExtraActionButton1:SetPoint("RIGHT", -4, -4)
ExtraAbilityContainer:SetScale(0.78)
ExtraActionButton1.style:SetAlpha(0)
-- Zone ability action button
ZoneAbilityFrame.Style:SetAlpha(0)
ZoneAbilityFrame.Style:Hide()
-- Hides loss control background
LossOfControlFrame.blackBg:SetAlpha(0)
LossOfControlFrame.RedLineTop:SetAlpha(0)
LossOfControlFrame.RedLineBottom:SetAlpha(0)
-- Hides bags
MicroButtonAndBagsBar:Hide()
-- Minimap zoom icons
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()

-- Hide macros -- Uncomment which actionbar you want to disable macros/hotkeys
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

-- Minimap scrollwheel zoom in/out
Minimap:EnableMouseWheel(true)
Minimap:SetScript("OnMouseWheel", function(self, arg1)
  if arg1 > 0 then
    Minimap_ZoomIn()
  else
    Minimap_ZoomOut()
  end
end)

-- Focus cast bar scale
FocusFrameSpellBar:SetScale(1.50)
-- Target castbar scale
TargetFrameSpellBar:SetScale(1.50)
-- Player buff frame scale
BuffFrame:SetScale(1.1)

-- Move right button actionbar
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

-- Set pet bar position
PetActionButton1:ClearAllPoints()
-- Main petbar
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