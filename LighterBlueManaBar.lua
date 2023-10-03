local function ChangeManaBarColor()
	if not PlayerFrameManaBar then return end
	PlayerFrameManaBar:SetStatusBarColor(0, 0.7, 1)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_TARGET_CHANGED" then
		ChangeManaBarColor(PlayerFrameManaBar)
		ChangeManaBarColor(TargetFrameManaBar)
	end
end)

