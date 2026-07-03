--To add new weapons make a new weapon list json at data/gungaym/weapon_lists/ ;)

--will be filled with tiers from chosen weapon list json
tiers = nil
--will be filled with final weapons
weplist = {}

--get count
if SERVER then
	util.AddNetworkString("SendCount")
end
local c = 0
if CLIENT then
	net.Receive( "SendCount", function()
		c = net.ReadInt(8)
		print("client recieved count of " .. c)
	end )
end

function RandomizeWeapons()
	if SERVER then
		local files, directories = file.Find("data/gungaym/weapon_lists/*.json", "THIRDPARTY")
		local JSONData = file.Read("data/gungaym/weapon_lists/" .. files[math.random(#files)], "THIRDPARTY")
		local list = util.JSONToTable(JSONData)
		tiers = list.tiers
		
		PrintMessage(HUD_PRINTCENTER, "You will be fighting with... " .. list.name .. " weapons.")
		
		--calc count
		c = 0
		for i in pairs(tiers) do
			for _ in pairs(tiers[i]) do
				c=c+1
			end
		end
		
		-- send count to client
		net.Start("SendCount")
		net.WriteInt(c, 8)
		net.Broadcast()
	end
	
	weplist = {}
	for i in pairs(tiers) do
		local r = math.random(#tiers[i]) -- select a random gun index
		table.insert(weplist, tiers[i][r])
	end
end

--Counts how many weapons there are in the list at the top
function count()
	return c
end

