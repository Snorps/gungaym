--You can just drop new weapon ents into the master list and the game will adapt, no extra configuring needed!
tiers = {
	{"weapon_rpg", "gy_onii_launcher","gy_aa12","gy_awp","gy_ak"},
	{"gy_ppsh","gy_spas", "gy_g3", "gy_m249","gy_tmp"},
	{"gy_deagle", "gy_m4","gy_mp5", "gy_cz", "gy_m3"},
	{"weapon_python","gy_glock"}
}
--will be filled with final weapons
weplist = {}


--I found this function online, was much smaller than the 3 function colossus I had :p
function RandomizeWeapons()
	weplist = {}
	l=count()
	for i in pairs(tiers) do
		local r = math.random(#tiers[i]) -- select a random gun index
		table.insert(weplist, tiers[i][r])
	end
end

--Counts how many weapons there are in the list at the top
function count()
	local c=0
	for i in pairs(tiers) do
		for _ in pairs(tiers[i]) do
			c=c+1
		end
	end
	return(c)
end

