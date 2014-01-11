--[[
     gamestate_manager
     By: Steven Avery
     Purpose: To be able to switch game between existing states
     *NOTE: a states load function is called when the state is first set, not when the game loads
  ]]

state = {}
local statesList = {}
local currentState = nil

function state.newState (id, class)
	statesList[id] = class
end

function state.setState (id)
	currentState = statesList[id]

	if currentState ~= nil then
		if currentState.load ~= nil then
			currentState.load ()
		end
	end
end

function state.load ()

end

function state.draw ()
	if currentState ~= nil then
		if currentState.draw ~= nil then
			currentState.draw ()
		end
	end
end

function state.update (dt)
	if currentState ~= nil then
		if currentState.update ~= nil then
			currentState.update (dt)
		end
	end
end

function state.focus (bool)
	if currentState ~= nil then
		if currentState.focus ~= nil then
			currentState.focus (bool)
		end
	end
end

function state.keypressed (key, unicode)
	if currentState ~= nil then
		if currentState.keypressed ~= nil then
			currentState.keypressed (key, unicode)
		end
	end
end

function state.keyreleased (key, unicode)
	if currentState ~= nil then
		if currentState.keyreleased ~= nil then
			currentState.keyreleased (key, unicode)
		end
	end
end

function state.mousepressed (x, y, button)
	if currentState ~= nil then
		if currentState.mousepressed ~= nil then
			currentState.mousepressed (x, y, button)
		end
	end
end

function state.mousereleased (x, y, button)
	if currentState ~= nil then
		if currentState.mousereleased ~= nil then
			currentState.mousereleased (x, y, button)
		end
	end
end

function state.resize (w, h)
	if currentState ~= nil then
		if currentState.resize ~= nil then
			currentState.resize (w, h)
		end
	end	
end

function state.quit ()
	if currentState ~= nil then
		if currentState.quit ~= nil then
			currentState.quit ()
		end
	end	
end