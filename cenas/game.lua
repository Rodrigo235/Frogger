local scene = composer.newScene( )
local mapa = require ("objects.mapa")

function scene:create( event )
	local sceneGroup = self.view
	local backGround = display.newRect( centroX, centroY, largura, altura)
	backGround:setFillColor(0.2, 0.2, 0.2)
	backGround:toBack( )
	
	sceneGroup:insert(backGround)
end

function scene:show( event )
	if(event.phase == "will") then
		mapa:startGame()
	end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)

return scene