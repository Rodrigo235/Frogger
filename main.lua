-----------------------------------------------------------------------------------------
--      _________ 	  ________ 		  _________
--     /  /_____/	 /  / __  \ 	 /  ___   /
--    /  /___ 		/  / /_/  |		/  /  /  /
--   /  /___/	   /  /______/	   /  /  /  /
--  /  /		  /  /\  \		  /  /__/  /
-- /__/			 /__/  \__\		 /________/
-----------------------------------------------------------------------------------------

--

local Map = require "objects.mapa"

Map:startGame()

function mover()
	Map:moverPersonagem("cima")	
end

--timer.performWithDelay( 500, mover, 0 )