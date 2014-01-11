
-- The level data
local levelData = {
	worldBounds = {}, -- The how far the camera should render out to
	rect = {} -- all of the blocks in the level
}

-- Level class for the gamestate
level = {}
BORDER_SIZE = 1 -- constant required border
local gridSquareSize = 32 -- The size of a square on the grid
local offsetx, offsety -- offset of the objects to keep the level centred in the screen

-- Loads the level (in this case, hard coded)
function level.load ()
	levelData.worldBounds = {x = 1, y = 0, width = 20, height = 10}
	table.insert (levelData.rect, {r = 255, g = 0, b = 0, x = 3, y = 2, width = 3, height = 1, isHor = true})
end

-- Calculates the size of a grid square, and offsetting
local function calcGridSize (width, height)
	local maxgridSquareWidth = love.graphics.getWidth () / ((BORDER_SIZE * 2) + levelData.worldBounds.width)
	local maxgridSquareHeight = love.graphics.getHeight () / ((BORDER_SIZE * 2) + levelData.worldBounds.height)

	if (maxgridSquareWidth < maxgridSquareHeight) then
		gridSquareSize = maxgridSquareWidth
	else 
		gridSquareSize = maxgridSquareHeight
	end
end

-- Calculates the offset for to have the level centred
local function calcGridOffset (width, height)
	local minBoundsWidth = ((BORDER_SIZE * 2) + levelData.worldBounds.width) * gridSquareSize
	local minBoundsHeight = ((BORDER_SIZE * 2) + levelData.worldBounds.height) * gridSquareSize

	offsetx = (love.graphics.getWidth () - minBoundsWidth) / 2
	offsety = (love.graphics.getHeight () - minBoundsHeight) / 2
end

-- Draws the base grid
local function drawBaseGrid ()
	love.graphics.setColor (48, 48, 48, 255)

	gridOffsetx = offsetx % gridSquareSize
	gridOffsety = offsety % gridSquareSize

	for i = 1, love.graphics.getWidth (), gridSquareSize do
		love.graphics.line (i + gridOffsetx, 0, i + gridOffsetx, love.graphics.getHeight ())
	end
	for i = 1, love.graphics.getHeight (), gridSquareSize do
		love.graphics.line (0, i + gridOffsety, love.graphics.getWidth (), i + gridOffsety)
	end
end

-- Draws a box of where the world bounds should be
local function drawWorldBounds ()
	love.graphics.setColor (32, 128, 32, 255)
	love.graphics.rectangle ("line", BORDER_SIZE * gridSquareSize + offsetx, BORDER_SIZE * gridSquareSize + offsety, 
							levelData.worldBounds.width * gridSquareSize, levelData.worldBounds.height * gridSquareSize)

end

-- Draws the rectangles (blocks)
local function drawRect ()
	for i, v in pairs (levelData.rect) do
		love.graphics.setColor (v.r, v.g, v.b, 255)
		love.graphics.rectangle ("fill", (v.x - levelData.worldBounds.x) * gridSquareSize + offsetx, (v.y -  levelData.worldBounds.y) * gridSquareSize + offsety, v.width * gridSquareSize, v.height * gridSquareSize)
	end
end



-- Draws the level data, as need be
function level.draw (mode)
	drawBaseGrid ()
	if (mode == "developer") then
		drawWorldBounds ()
	end

	drawRect ()
end

function level.resize (w, h)
	calcGridSize (w, h)
	calcGridOffset (w, h)
end