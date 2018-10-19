local _M require "objects.mapa"

local _C = {}

function _C:makeControl()
	local imagem = "images/BotaoDirecional.png"

	_C.direcionalBaixo = display.newImage(imagem)
	_C.direcionalBaixo.x = centroX
	_C.direcionalBaixo.y = altura - ((_C.direcionalBaixo.contentBounds.yMax - _C.direcionalBaixo.contentBounds.yMin) * 1.5)
	_C.direction = "baixo"
	_C.direcionalBaixo:addEventListener("touch", _C:mover)


	-- -- BOTAO CIMA
	-- buttons[1] = display.newImage(imagemBotao)
	-- buttons[1].anchorX = 0.5
	-- buttons[1].anchorY = 0.0
	-- buttons[1]:rotate ( 180 )
	-- buttons[1].x = w * 0.07
	-- buttons[1].y = h * 0.5
	-- buttons[1].width = 30
	-- buttons[1].height = 35
	-- buttons[1].myName = "up"


	-- --BOTAO BAIXO
	-- buttons[2] = display.newImage(imagemBotao)
	-- buttons[2].anchorX = 0.5
	-- buttons[2].anchorY = 0.0
	-- buttons[2].x = buttons[1].x
	-- buttons[2].y = buttons[1].y
	-- buttons[2].width = 30
	-- buttons[2].height = 35
	-- buttons[2].myName = "down"

	-- --BOTAO ESQUERDA
	-- buttons[3] = display.newImage(imagemBotao)
	-- buttons[3].anchorX = 0.5
	-- buttons[3].anchorY = 0.0
	-- buttons[3]:rotate ( 90 )
	-- buttons[3].x = buttons[1].x
	-- buttons[3].y = buttons[1].y
	-- buttons[3].width = 30
	-- buttons[3].height = 35
	-- buttons[3].myName = "left"

	-- --BOTAO DIREITA
	-- buttons[4] = display.newImage(imagemBotao)
	-- buttons[4].anchorX = 0.5
	-- buttons[4].anchorY = 0.0
	-- buttons[4]:rotate ( 270 )
	-- buttons[4].x = buttons[1].x
	-- buttons[4].y = buttons[1].y
	-- buttons[4].width = 30
	-- buttons[4].height = 35
	-- buttons[4].myName = "right"

end

function _C:mover(direction)
	_M:moverPersonagem(direction)
end

return _C