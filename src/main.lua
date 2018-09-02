local diagram

function setup()
	size(640,480)
	frameRate(30)
	background(255)
	diagram = assert(loadfile("example1.lua"))
	diagram1 = assert(loadfile("example2.lua"))
end

function draw()
	diagram()
	translate(0,200)
	diagram1()
end

function windowResized(w,h)
	print("windowResized",w,h)
end
