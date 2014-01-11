require "gamestate_manager"
require "testing_state"

function love.load ()
	state.newState ("test", testingState)
	state.setState ("test")

	state.load()
end

function love.draw ()
	state.draw()
end

function love.update (dt)
	state.update (dt)
end

function love.focus (bool)
	state.focus (bool)
end

function love.keypressed (key, unicode)
	state.keypressed (key, unicode)
end

function love.keyreleased (key, unicode)
	state.keyreleased (key, unicode)
end

function love.mousepressed (x, y, button)
	state.mousepressed (x, y, button)
end

function love.mousereleased (x, y, button)
	state.mousereleased (x, y, button)
end

function love.resize(w, h)
	state.resize (w, h)
end

function love.quit()
	state.quit ()
end