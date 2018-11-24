local scene = composer.newScene( )

function scene:create( event )
	local sceneGroup = self.view
	local backGround = display.newRect( centroX, centroY, largura, altura)
	backGround:setFillColor(0.2, 0.2, 0.2)
	backGround:toBack( )

	local textFrogger = display.newText("FROGGER", centroX, altura * 0.1, "Comic Sans MS", 60)
	textFrogger:setFillColor(0.3, 1, 0.3)

	local textStart = display.newText("Start", centroX, altura * 0.6, "Comic Sans MS", 40)
	textStart:setFillColor(0.2, 0.7, 1)
	textStart:addEventListener("touch", scene)

	local textRank = display.newText("Rank", centroX, altura * 0.7, "Comic Sans MS", 40)
	textRank:setFillColor(0.2, 0.7, 1)
	textRank:addEventListener("touch", scene)

	local textExit = display.newText("Exit", centroX, altura * 0.8, "Comic Sans MS", 40)
	textExit:setFillColor(0.2, 0.7, 1)
	textExit:addEventListener("touch", scene)

	sceneGroup:insert(backGround)
	sceneGroup:insert(textFrogger)
	sceneGroup:insert(textStart)
	sceneGroup:insert(textRank)
	sceneGroup:insert(textExit)
end

function scene:show( event )
	local sceneGroup = self.view

	sceneGroup.isVisible = true
end

function scene:hide( event )
	local sceneGroup = self.view

	sceneGroup.isVisible = false
end

function scene:destroy( event )
	local sceneGroup = self.view

	display.remove(sceneGroup)
end

function scene:touch( event )
	if(event.phase == "began") then
		if(event.target.text == "Start") then
			composer.gotoScene("cenas.game")
		end
		if(event.target.text == "Rank") then
			composer.gotoScene( "cenas.rank", {effect = "fade", time = 200})
		end
		if(event.target.text == "Exit") then
			native.requestExit()
		end
	end
end

scene:addEventListener("create", scene )
scene:addEventListener("show", scene )
scene:addEventListener("hide", scene )
scene:addEventListener("destroy", scene )

return scene