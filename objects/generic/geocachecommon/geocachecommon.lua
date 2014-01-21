

function init(args)
	entity.setInteractive(true);
	
	if not storage.geocache then
		--[[local loadedData = entity.configParameter("geocache");
		if loadedData then
			storage.geocache = loadedData;
			entity.setAnimationState("geocacheState", "inactive");
		else
			entity.setAnimationState("geocacheState", "inactive");
		end--]]
		entity.setAnimationState("geocacheState", "inactive");
	else
		entity.setAnimationState("geocacheState", "inactive");
	end
end

function main()
	
	if storage.geocache then
		--ping();
	end
	
end

function onInteraction(args)
	local pid = args["sourceId"]
	if not storage.geocache then
		
		--first placement
		storage.geocache = {
			--currentPlanet = world.info(), for when they add this back (?)
			currentPosition = entity.position(),
			ownerId = world.entityUuid(pid),
			ownerName = world.entityName(pid),
			playerFTF = nil,
			finders = {},
			item = {}
		}
		
		entity.setAnimationState("geocacheState", "active");
		
		return { "ShowPopup", { message = "^white;Planet Name: ^red;" .. "not yet implemented" ..
								"\n^white;Owner: ^green;" .. storage.geocache.ownerName
		}}
		

		
	else
		
		local currentPlayer = world.entityName(pid);
		
		-- first to find
		--if not storage.geocache.playerFTF and storage.geocache.ownerId ~= world.entityUuid(pid) then
		if not storage.geocache.playerFTF then	
			storage.geocache.playerFTF = currentPlayer;
			table.insert(storage.geocache.finders, currentPlayer);
		end
	
	    table.insert(storage.geocache.finders, currentPlayer);
	
		entity.setAnimationState("geocacheState", "active");
	
		local finderList = "\n^white;"
		
		for _, finder in pairs(storage.geocache.finders) do
			finderList = finderList .. "\n" .. finder
		end
	
		return { "ShowPopup", { message = "^white;Planet Name: ^red;" .. "not yet implemented" ..
								"\n^white;Owner: ^green;" .. storage.geocache.ownerName ..
								"\n^white;FTF: ^blue;" .. storage.geocache.playerFTF ..
								"\n^white;Finder log: ^white;" .. finderList
		}}
	
	end
	
end