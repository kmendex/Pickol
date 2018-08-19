local diagram

function setup()
	size(640,480)
	background(255)
	diagram = assert(loadfile("example1.lua"))
end

function draw()
	diagram()
end
