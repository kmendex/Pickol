local indX,indY=0,0
local defaultSz=60
local f = createFont("Vera.ttf",12)
textFont(f)

pic = pic or {}

pic.box = function(txt,dashed)
	rect(indX,indY+15,50,30)
	fill(0)
	text(txt,indX+1,indY+25)
	noFill()
	indX=indX+50
end

pic.circle = function(txt)
	
end

pic.ellipse = function(txt)
	ellipse(indX+25,indY+25,50,30)
	fill(0)
	text(txt,indX+1,indY+25)
	noFill()
	indX=indX+50
end

pic.arc = function()
	
end

pic.line = function()
	
end

pic.arrow = function()
	line(indX,indY+25,indX+50,indY+25)
	indX=indX+50	
end

pic.spline = function()
	
end

pic.move = function()
	
end

pic.text_list = function()
	
end

pic.PE = function()
	indX,indY=0,0
	noFill()
end
