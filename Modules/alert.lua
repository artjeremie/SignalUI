-- Hide alert loot/achievement frame
hooksecurefunc(AlertFrame, "RegisterEvent", function(self, event)
  AlertFrame:UnregisterEvent(event)
end)

AlertFrame:UnregisterAllEvents()