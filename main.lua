-----------------------------------------------------------------------------------------
--      _________ 	  ________ 		  _________
--     /  /_____/	 /  / __  \ 	 /  ___   /
--    /  /___ 		/  / /_/  |		/  /  /  /
--   /  /___/	   /  /______/	   /  /  /  /
--  /  /		  /  /\  \		  /  /__/  /
-- /__/			 /__/  \__\		 /________/
-----------------------------------------------------------------------------------------

--
require "objects.globals"
--local Map = require "objects.mapa"

-- Map:startGame()

-- function mover()
-- 	Map:moverPersonagem("cima")	
-- end

-- timer.performWithDelay( 500, mover, 0 )

-- for i,v in ipairs(native.getFontNames()) do
-- 	print(i,v)
-- end

local mapa = require "objects.mapa"
mapa:startGame()
