function init(args)
end

function main()
	if self.initialized == nil then
    	initializeObject();
		self.initialized = true;
	end
end

function initializeObject()
	entity.setInteractive(true);
	entity.setAnimationState("geocachestate", "inactive");
	
	if self.tradingConfig == nil then
		self.tradingConfig = buildTradingConfig();
	end
	
end

function onInteraction(args)
	--return { "OpenCraftingInterface", self.tradingConfig }
	entity.setAnimationState)"geocachestate", "active");
end

function buildTradingConfig ()

local currentPlanet = world.info();
local currentPosition = entity.position();


end
