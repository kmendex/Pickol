local indX,indY = 10,10	-- posicion X y posicion Y
local defaultWid = 100	-- ancho por defecto
local defaultHt			-- alto por defecto

-------------built-in variables-----------------------------------------
local boxwid, boxht
local circlerad
local arcrad
local ellipsewid, ellipseht
local linewid, lineht
local movewid, moveht
local arrowwid, arrowht
-------------------------------------------------------------------------

local f = createFont("data/Vera.ttf",12)
local sizFont = 12	-- tamaño de la fuente
textFont(f)

pic = pic or {}

pic.PS= function(opt_width,opt_height)
	defaultWid = opt_width or defaultWid	-- ancho distinto
	defaultHt = opt_height or defaultWid	-- alto distinto o escala 1:1 con el ancho
	-- valores proporcionales
	boxwid, boxht = defaultWid * 0.75, defaultHt * 0.5
	circlerad = defaultWid * 0.5
	arcrad = defaultWid * 0.5
	ellipsewid, ellipseht = defaultWid * 0.75, defaultHt * 0.5
	linewid, lineht = defaultWid * 0.5, defaultHt * 0.5
	movewid, moveht = defaultWid * 0.5, defaultHt * 0.5
	arrowwid, arrowht = defaultWid * 0.1, defaultHt * 0.05
end

pic.box = function(txt,dashed)
	local txt = txt or {}
	local boxwid = boxwid -- or tamaño en parametro
	local boxht = boxht
	if dashed then
		beginShape(LINES)
		local tamx, tamy = boxwid/4, boxht/4		
		for x = indX, indX+boxwid-1, tamx*2 do
			line(x,indY,x+tamx,indY)
--			line(x,indY+boxht,x+tamx,indY+boxht)
			line(x+tamx,indY+boxht,x,indY+boxht)
		end 
		for y = indY, indY+boxht-1, tamy*2 do
			line(indX,y,indX,y+tamy)
--			line(indX+boxwid,y,indX+boxwid,y+tamy)
			line(indX+boxwid,y+tamy,indX+boxwid,y)
		end 
		endShape()
	else
		rect(indX,indY,boxwid,boxht) 
	end
	local posTxt = indY+boxht/2-(#txt/2-1)*sizFont
	fill(0)
	for ind,val in pairs(txt) do
		text(txt[ind],indX+boxwid/6,posTxt+(ind-1)*sizFont)
	end
	noFill()
	indX=indX+boxwid
end

pic.circle = function(txt)
	local txt = txt or {}
	local circlerad = circlerad
	pic.ellipse(txt,circlerad,circlerad)
end


pic.ellipse = function(txt,w,h)
	local txt = txt or {}
	local ellipsewid = w or ellipsewid
	local ellipseht = h or ellipseht
	ellipse(indX+ellipsewid/2,indY+ellipseht/2,ellipsewid,ellipseht)
	local posTxt = indY+ellipseht/2-(#txt/2-1)*sizFont
	fill(0)
	for ind,val in pairs(txt) do
		text(txt[ind],indX+ellipsewid/6,posTxt+(ind-1)*sizFont)
	end
	noFill()
	indX=indX+ellipsewid
end

pic.arc = function(txt)
	local txt = txt or {}
	local arcrad = arcrad
	arc(indX,indY+25,arcrad,arcrad,0,PI/2)
	local posTxt = indY+arcrad/2-(#txt/2-1)*sizFont
	fill(0)
	for ind,val in pairs(txt) do
		text(txt[ind],indX+arcrad/4,posTxt+(ind-1)*sizFont)
	end
	noFill()
	indX=indX+arcrad
end

pic.line = function(txt,dashed)
	local txt = txt or {}
	local linewid = linewid
	local lineht = lineht
	if dashed then
		beginShape(LINES)
		local tamx= boxwid/4		
		for x = indX, indX+linewid-1, tamx*2 do
			line(x,indY+lineht/2,x+tamx,indY+lineht/2)
		end 
		endShape()
	else
		line(indX,indY+lineht/2,indX+linewid,indY+lineht/2)		
	end
	local posTxt = indY+lineht/2-(#txt/2-1)*sizFont
	fill(0)
	for ind,val in pairs(txt) do
		text(txt[ind],indX+linewid/6,posTxt+(ind-1)*sizFont)
	end
	noFill()
	indX=indX+linewid
end

pic.arrow = function(txt)
	local txt = txt or {}
	local arrowwid = arrowwid
	local arrowht = arrowht
	pic.line(txt)
	line(indX-arrowwid,indY+lineht/2-arrowht,indX,indY+lineht/2)
	line(indX-arrowwid,indY+lineht/2+arrowht,indX,indY+lineht/2)
	noFill()
end

--[[pic.spline = function()
	
end]]

pic.move = function(w,h)
	local movewid = w or movewid
	local moveht = h or moveht
	indX=indX+movewid
end

--[[pic.text_list = function()
	
end]]

pic.PE = function()
	indX,indY=10,10
	noFill()
end
