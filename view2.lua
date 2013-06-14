-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--		 unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

print("view2: OUTSIDE")

local amIStillHere = true
print("view2: outside createScene amIStillHere = ", amIStillHere)

local function testMe()
print("view2: testMe() executed")
end

testMe()

-- Forward reference
local mapView, createMap
	
-- Called when the scene's view does not exist:
function scene:createScene( event )
print("view2: createScene()")
print("view2: inside createScene amIStillHere = ", amIStillHere)

	local group = self.view
	
	local bg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
	bg:setFillColor( 255 )
	group:insert( bg )
	
	------------------------------------
	-- map
	------------------------------------
	function createMap()
		mapView = native.newMapView( 20, 40, 300, 220 )
		if mapView then
			mapView.mapType = "normal"
			mapView.x = display.contentWidth / 2
			mapView.y = 120
			mapView:setCenter( 14.583417 , 121.058494 )
		end
	end

end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
print("view2: enterScene()")
	local group = self.view
	
	local previous_scene_name = storyboard.getPrevious()
	if previous_scene_name ~= nil then
print("removeScene(", previous_scene_name, ")")
		storyboard.removeScene( previous_scene_name )
	end
	
	createMap()
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
print("view2: exitScene()")
	local group = self.view
	
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
print("view2: destroyScene()")
	local group = self.view
	
	-- INSERT code here (e.g. remove listeners, remove widgets, save state variables, etc.)
	mapView:removeSelf()
	
end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene
