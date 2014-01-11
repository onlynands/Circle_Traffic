require "level"

testingState = {}

function testingState.load ()
	love.graphics.setBackgroundColor (0, 0, 0)

	level.load ()
	level.resize ()

	print ("Testing State loaded.")
end

function testingState.draw ()
	level.draw ("developer")

	love.graphics.setColor (0, 255, 0, 255)
	love.graphics.print ("Mouse: " .. x .. ", " .. y, 10, 10) --Outputing mouse information
	love.graphics.print ("FPS: " .. love.timer.getFPS(), 10, 24) --Outputing FPS information
end

function testingState.update (dt)
	x, y = love.mouse.getPosition()
end

function testingState.focus (bool)

end

function testingState.keypressed (key, unicode)
	print ("Key pressed: " .. key)
	if key == "escape" then
		love.event.quit() --Close the program
	end
end

function testingState.keyreleased (key, unicode)

end

function testingState.mousepressed (x, y, button)
	print ("Mouse Pressed: (" .. x .. ", " .. y .. ") Button: " .. button)
end

function testingState.mousereleased (x, y, button)

end

function testingState.resize (w, h)
	print (("Window resized to width: %d and height: %d"):format(w, h))

	level.resize ()
end

function testingState.quit ()

end