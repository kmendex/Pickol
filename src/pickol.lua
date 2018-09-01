local indX,indY = 10,10
local defaultWid = 100
local defaultHt
local f = createFont("Vera.ttf",12)
textFont(f)

pic = pic or {}

pic.PS= function(opt_width,opt_height)
	defaultWid = opt_width or defaultWid
	defaultHt = opt_height or defaultWid
end

pic.box = function(txt,dashed)
	local boxwid = defaultWid * 0.75
	local boxht = defaultHt * 0.5
	rect(indX,indY,boxwid,boxht)
	fill(0)
	text(txt,indX+1,indY+25)
	noFill()
	indX=indX+boxwid
end

pic.circle = function(txt)
	local circlerad = defaultWid * 0.25
	pic.ellipse(txt,circlerad,circlerad)
end


pic.ellipse = function(txt,w,h)
	local ellipsewid = w or defaultWid * 0.75
	local ellipseht = h or defaultHt * 0.5
	ellipse(indX+ellipsewid/2,indY+ellipseht/2,ellipsewid,ellipseht)
	fill(0)
	text(txt,indX+1,indY+25)
	noFill()
	indX=indX+ellipsewid
end

pic.arc = function(txt)
	local arcrad = defaultWid * 0.25
	arc(indX,indY+25,arcrad,arcrad,0,PI/2)
	fill(0)
	text(txt,indX+1,indY+25)
	noFill()
	indX=indX+arcrad
end

pic.line = function(txt)
	local linewid = defaultWid * 0.5
	local lineht = defaultHt * 0.5
	line(indX,indY+lineht/2,indX+linewid,indY+lineht/2)
	fill(0)
	text(txt,indX+1,indY+20)
	noFill()
	indX=indX+linewid
end

pic.arrow = function(txt)
	local arrowwid = defaultWid * 0.05
	local arrowht = default * 0.1
	line(indX,indY+25,indX+50,indY+25)
	line(indX+40,indY+20,indX+50,indY+25)
	line(indX+40,indY+35,indX+50,indY+25)
	fill(0)
	text(txt,indX+1,indY+20)
	noFill()
	indX=indX+50	
end

pic.spline = function()
	
end

pic.move = function()
	local movewid = defaultWid * 0.5
	local moveht = defaultHt * 0.5
	indX=indX+movewid
end

pic.text_list = function()
	
end

pic.PE = function()
	indX,indY=10,10
	noFill()
end
