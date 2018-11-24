local scene = composer.newScene( )

function scene:create( event )
	local sceneGroup = self.view

	local backGround = display.newRect( centroX, centroY, largura, altura)
	backGround:setFillColor(0.2, 0.2, 0.2)
	backGround:toBack( )
	
	local textFase = display.newText("Maior Fase", centroX, centroY * 0.2, "Comic Sans MS", 50)
	textFase:setFillColor(0.2, 0.7, 1)

	local textFase2 = display.newText("Alcançada", centroX, centroY * 0.4, "Comic Sans MS", 50)
	textFase2:setFillColor(0.2, 0.7, 1)

	local fase = display.newText(tostring(maiorFase), centroX, altura * 0.5, "Comic Sans MS", 250)
	fase:setFillColor(0.3, 1, 0.3)

	local textVoltar = display.newText("Voltar", centroX, altura * 0.8, "Comic Sans MS", 50)
	textVoltar:setFillColor(0.2, 0.7, 1)
	textVoltar:addEventListener("touch", scene)


	sceneGroup:insert(backGround)
	sceneGroup:insert(textFase)
	sceneGroup:insert(textFase2)
	sceneGroup:insert(fase)
	sceneGroup:insert(textVoltar)
end

function scene:destroy( event )
	local sceneGroup = self.view

	display.remove( sceneGroup )
end

function scene:touch( event )
	composer.removeScene( "cenas.rank" )
	composer.gotoScene( "cenas.menu", {effect = "fade"} )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )

return scene