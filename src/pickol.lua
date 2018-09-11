local indX,indY = 10,10	-- posicion X y posicion Y
local indXR,indYR = width()-10,height()-10
local defaultWid = 100	-- ancho por defecto
local defaultHt			-- alto por defecto
local drawRight,drawDown,drawLeft,drawUp = true,false,false,false

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

pic.box = function(args)
	local txt = args.text or {}
	local boxwid = args.width or args.wid or boxwid -- or tamaño en parametro
	local boxht = args.height or args.ht or boxht
	local xBox,yBox = indX,indY
	
	if drawLeft then 
		xBox=indXR-boxwid
		indX=xBox
	elseif drawUp then
		yBox=indYR-boxht
		indY=yBox
	end

	if dashed then
		beginShape(LINES)
		local tamx, tamy = boxwid/4, boxht/4		
		for x = xBox, xBox+boxwid-1, tamx*2 do
			line(x,yBox,x+tamx,yBox)
--			line(x,indY+boxht,x+tamx,indY+boxht)
			line(x+tamx,yBox+boxht,x,yBox+boxht)
		end 
		for y = yBox, yBox+boxht-1, tamy*2 do
			line(xBox,y,xBox,y+tamy)
--			line(indX+boxwid,y,indX+boxwid,y+tamy)
			line(xBox+boxwid,y+tamy,yBox+boxwid,y)
		end 
		endShape()
	else
		rect(xBox,yBox,boxwid,boxht) 
	end
	local posTxt = yBox+boxht/2-(#txt/2-1)*sizFont
	fill(0)
	for ind,val in pairs(txt) do
		text(txt[ind],xBox+boxwid/6,posTxt+(ind-1)*sizFont)
	end
	noFill()

	if drawDown then 	
		indY=indY+boxht
	else
		indX=indX+boxwid
	end
end

pic.circle = function(args)
	local txt = args.text or {}
	local circlerad = args.radius or args.rad or circlerad --args.diameter/2 or args.diam/2 or args.radius or args.rad or circlerad
	pic.ellipse{text=txt,wid=circlerad,ht=circlerad}
end


pic.ellipse = function(args)
	local txt = args.text or {}
	local ellipsewid = args.width or args.wid or ellipsewid
	local ellipseht = args.height or args.ht or ellipseht	
	local xEllipse,yEllipse = indX,indY
	
	if drawLeft then
		xEllipse=indXR-ellipsewid
		indX=xEllipse
	elseif drawUp then
		yEllipse=indYR-ellipseht
		indY=yEllipse
	end
	
	ellipse(xEllipse+ellipsewid/2,yEllipse+ellipseht/2,ellipsewid,ellipseht)
	local posTxt = yEllipse+ellipseht/2-(#txt/2-1)*sizFont
	fill(0)
	for ind,val in pairs(txt) do
		text(txt[ind],xEllipse+ellipsewid/6,posTxt+(ind-1)*sizFont)
	end
	noFill()

	if drawDown then
		indY=indY+ellipseht
	else
		indX=indX+ellipsewid
	end
end

pic.arc = function(args)
	local txt = args.text or {}
	local arcrad = args.radius or args.rad or arcrad --args.diameter/2 or args.diam/2 or args.radius or args.rad or arcrad
	local x,y = indX,indY
	
	if drawDown then	
	elseif drawRight then
	elseif drawUp then
	else
	end
	arc(indX,indY+25,arcrad,arcrad,0,PI/2)
	local posTxt = indY+arcrad/2-(#txt/2-1)*sizFont
	fill(0)
	for ind,val in pairs(txt) do
		text(txt[ind],indX+arcrad/4,posTxt+(ind-1)*sizFont)
	end
	noFill()
	if drawLeft then	
		indX=indX+arcrad
	elseif drawDown then
		indY=indY+arcrad
	end	
end

pic.line = function(args)
	local txt = args.text or {}
	local linewid = linewid
	local lineht = lineht
	local xLine,yLine = indX,indY
	local xLine1,yLine1

	if drawLeft then
		xLine1=indXR
		xLine=indXR-linewid
		indXR=xLine
		yLine=yLine+lineht/2
		yLine1=yLine
	elseif drawUp then
		yLine1=indYR
		yLine=indYR-lineht
		indYR=yLine
		xLine=xLine+linewid/2
		xLine1=xLine
	elseif drawDown then
		yLine1=indY
		indY=indY+lineht
		yLine=indY
		xLine=xLine+linewid/2
		xLine1=xLine
	else
		xLine1=indX
		indX=indX+linewid
		xLine=indX
		yLine=yLine+lineht/2
		yLine1=yLine
	end

	if dashed then
		beginShape(LINES)
		local tamx= linewid/4		
		for x = xLine, xLine+linewid-1, tamx*2 do
			line(x,yLine,x+tamx,yLine)
		end 
		endShape()
	else
		line(xLine,yLine,xLine1,yLine1)		
	end
	local posTxt = yLine+lineht/2-(#txt/2-1)*sizFont
	fill(0)
	for ind,val in pairs(txt) do
		text(txt[ind],xLine+linewid/6,posTxt+(ind-1)*sizFont)
	end
	noFill()
end

pic.arrow = function(args)
	local txt = args.text or {}
	local arrowwid = arrowwid
	local arrowht = arrowht
	local xArrowH,yArrowH
	local xHead,yHead,x1Head,y1Head

	pic.line{text=txt}
	if drawDown then
		xArrowH=indX+linewid/2
		yArrowH=indY
		xHead = xArrowH-arrowht
		x1Head = xArrowH+arrowht
		yHead = yArrowH-arrowwid
		y1Head = yHead
	elseif drawLeft then
		xArrowH=indXR
		yArrowH=indYR+lineht/2
		xHead = xArrowH-arrowwid
		x1Head = xHead
		yHead = yArrow-arrowht
		y1Head = yArrow+arrowht	
	elseif drawUp then		
		xArrowH=indXR+linewid/2
		yArrowH=indYR
		xHead = xArrowH-arrowht
		x1Head = xArrowH+arrowht
		yHead = yArrowH-arrowwid
		y1Head = yHead
	else
		xArrowH=indX
		yArrowH=indY+lineht/2
		xHead = xArrowH-arrowwid
		x1Head = xHead
		yHead = yArrowH-arrowht
		y1Head = yArrowH+arrowht
	end

	--line(indX-arrowwid,indY+lineht/2-arrowht,indX,indY+lineht/2)
	--line(indX-arrowwid,indY+lineht/2+arrowht,indX,indY+lineht/2)
	--line(xArrowH-arrowwid,yArrowH+lineht/2-arrowht,xArrowH,yArrowH+lineht/2)
	--line(xArrowH-arrowwid,yArrowH+lineht/2+arrowht,xArrowH,yArrowH+lineht/2)
	line(xArrowH,yArrowH,xHead,yHead)
	line(xArrowH,yArrowH,x1Head,y1Head)
	noFill()
end

--[[pic.spline = function()
	
end]]

pic.move = function(args)
	local movewid = w or movewid
	local moveht = h or moveht
	local x,y = indX,indY
	
	if drawDown then	
	elseif drawRight then
	elseif drawUp then
	else
	end
	if drawLeft then	
		indX=indX+movewid
	elseif drawDown then
		indY=indY+moveht
	end
end

--[[pic.text_list = function()
	
end]]

pic.left = function()
	drawLeft = true
	drawRight, drawDown, drawUp = false,false,false
end

pic.up = function()
	drawUp = true
	drawRight, drawDown, drawLeft = false,false,false
end

pic.down = function()
	drawDown = true
	drawRight, drawLeft, drawUp = false,false,false
end

pic.right = function()
	drawRight = true
	drawDown, drawLeft, drawUp = false,false,false
end

pic.reset = function()

end

pic.PE = function()
	indX,indY=10,10
	noFill()
end

--[[function param(...)
	local listParam={text={},
		dash=0,
		wid=0,
		ht=0,
		dotted=0,
		invis=false,
		fill=0,
		up=0,
		down=0,
		left=0,
		right=0,
		cw=false,
		rad=0,
		diameter=0
		}
	return listParam
end]]

