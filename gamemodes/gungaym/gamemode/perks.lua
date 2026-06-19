local ply = FindMetaTable("Player")

perks = {"fastreload","doubletap","deadeye"}

function ply:AwardPerk()
	local text = nil
	for k,v in RandomPairs(perks) do
		award = v
		if self:GetNWBool(award) == false then
			self:SetNWBool(award,true)
			if award == "fastreload" then
				text = "Sleight of Hand"
			elseif award == "doubletap" then
				text = "Double Tap"
			elseif award == "deadeye" then
				text = "Dead Eye"
			end
			break
		end	
	end
	
	if text ~= nil then
		self:PrintMessage(HUD_PRINTTALK,"You got the perk "..text.."!")
	end
end