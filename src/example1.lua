require "pickol"

--[[
--Example 1
pic.PS()
pic.ellipse {text={"document"}}
pic.arrow {}
pic.box {text={"PIC"}}
pic.arrow {}
pic.box {text={"TBL/EQN","(optional)"},dash=true}
pic.arrow {}  
pic.box {text={"TROFF"}}
pic.arrow {}
pic.ellipse {text={"typesetter"}}
pic.PE()
--]]

--[[
-- Example 2
pic.PS(150)
pic.box {text={"box"}}
pic.move ()
pic.line {text={"line"},dash=true}
pic.move ()
pic.arrow {text={"arrow"}}
pic.move ()
pic.circle {text={"circle"}}
pic.move ()
pic.ellipse {text={"ellipse"}}
pic.move ()
pic.arc {text={"arc"}}
pic.PE()
--]]

--[[
--Example 3
pic.PS()
pic.down ()
pic.box {text={"Invis","Box"},invis=true}
pic.arrow {}
pic.ellipse {}
pic.arrow {}
pic.circle {}
pic.PE()
--]]


-- Example 4
require "pickol"
pic.PS()
pic.box {width=3,ht=0.1}
pic.circle {radius=0.1}
pic.PE()
--]]

--[[
-- Example 
--]]
