-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local storyboard = require "storyboard"


-- event listeners for tab buttons:
local function onFirstView( event )
	storyboard.gotoScene( "view1" )
end

local function onSecondView( event )
	storyboard.gotoScene( "view2" )
end

local function onThirdView( event )
	storyboard.gotoScene( "view3" )
end


-- create a tabBar widget with two buttons at the bottom of the screen

-- table to setup buttons
local tabButtons = {
	{ label="First", defaultFile = "icon1.png", overFile = "icon1-down.png", width = 32, height = 32, onPress=onFirstView, selected=true },
 	{ label="Second", defaultFile = "icon2.png", overFile = "icon2-down.png", width = 32, height = 32, onPress=onSecondView },
 	{ label="Third", defaultFile = "icon3.png", overFile = "icon3-down.png", width = 32, height = 32, onPress=onThirdView },
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar{
	top = display.contentHeight - 50,	-- 50 is default height for tabBar widget
	buttons = tabButtons
}

onFirstView()	-- invoke first tab button's onPress event manually
