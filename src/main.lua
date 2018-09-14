local diagram

function setup()
	size(640,480)
	frameRate(30)
	background(255)	
	diagram = assert(loadfile("example1.lua"))
end

function draw()	
	diagram()
end

function windowResized(w,h)
	print("windowResized",w,h)
end
