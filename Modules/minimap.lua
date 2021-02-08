-- Scrollwheel to zoom in and zoom out
Minimap:EnableMouseWheel(true)
Minimap:SetScript("OnMouseWheel", function(self, arg1)
  if arg1 > 0 then
    Minimap_ZoomIn()
  else
    Minimap_ZoomOut()
  end
end)

-- Move zone text
MinimapZoneText:ClearAllPoints()
MinimapZoneText:SetPoint('TOPRIGHT', UIParent, "TOPRIGHT", -22, -7)
MinimapZoneText:SetFont("FONTS\\FRIZQT__.TTF", 10, "OUTLINE")

-- Move minimap
MinimapCluster:ClearAllPoints()
MinimapCluster:SetPoint('TOPRIGHT', UIParent, "TOPRIGHT", -5, -14)