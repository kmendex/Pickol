require "prekol"
local slides

function setup()
	size(640,480)
	background(255)
	slides = assert(loadfile("example1.lua"))
end

function draw()
	slides()
end
