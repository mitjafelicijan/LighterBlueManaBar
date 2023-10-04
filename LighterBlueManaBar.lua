local function ChangeManaBarColor(frame)
	if not frame then return end
	
	local _, classId = UnitClass(frame.unit)
	local manaBar = _G[frame:GetName().."ManaBar"]
	
	if classId == "MAGE" or classId == "PRIEST" or classId == "PALADIN" or classId == "WARLOCK" then
		manaBar:SetStatusBarColor(0, 0.7, 1)
	end
end

local frame = CreateFrame("Frame")

frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("UNIT_POWER_UPDATE")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")

frame:SetScript("OnEvent", function(self, event)
	ChangeManaBarColor(PlayerFrame)
	ChangeManaBarColor(TargetFrame)
end)

