-- Enable arrow keys for normal and existing chat frames
for i = 1, 50 do
  if _G["ChatFrame" .. i] then
    _G["ChatFrame" .. i .. "EditBox"]:SetAltArrowKeyMode(false)
  end
end