local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("UNIT_POWER_UPDATE")
frame:RegisterEvent("UNIT_TARGET")
frame:RegisterEvent("SPELL_UPDATE_USABLE")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("UPDATE_SHAPESHIFT_FORM")

frame:SetScript("OnEvent", function(self, event)
	local function ChangeManaBarColor(frame, bar, name)
		if not frame then return end

		local powerBar = _G[frame .. bar]
		if not powerBar then return end

		-- Mana power type is 0.
		local powerType = UnitPowerType(name)
		if powerType == 0 then
			powerBar:SetStatusBarColor(0, 0.7, 1)
		end
	end

	ChangeManaBarColor("PlayerFrame", "ManaBar", "player")
	ChangeManaBarColor("PetFrame", "ManaBar", "pet")
	ChangeManaBarColor("TargetFrame", "ManaBar", "target")
	ChangeManaBarColor("TargetFrameToT", "ManaBar", "tot")

	if IsInGroup() or IsInRaid() then
		for i = 1, MAX_PARTY_MEMBERS do
			ChangeManaBarColor("PartyMemberFrame" .. i, "ManaBar", "party" .. i)
		end
		for i = 1, MAX_RAID_MEMBERS do
			ChangeManaBarColor("CompactRaidFrame" .. i, "PowerBar", "raid" .. i)
		end
	end
end)
