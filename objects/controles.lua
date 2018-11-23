local _M = require "objects.mapa"

_M:startGame()

local _C = {}

function _C:makeControl()
	local imagem = "images/BotaoDirecional.png"

	_C.direcionalBaixo = display.newImage(imagem)
	_C.direcionalBaixo.x = centroX
	_C.direcionalBaixo.y = altura - ((_C.direcionalBaixo.contentBounds.yMax - _C.direcionalBaixo.contentBounds.yMin) * 1.5)
	_C.direcionalBaixo.direction = "baixo"
	_C.direcionalBaixo:addEventListener("touch", _C)


	_C.direcionalCima = display.newImage(imagem)
	_C.direcionalCima.x = centroX
	_C.direcionalCima.y = _C.direcionalBaixo.y - ((_C.direcionalCima.contentBounds.yMax - _C.direcionalCima.contentBounds.yMin))
	_C.direcionalCima:rotate(180)
	_C.direcionalCima.direction = "cima"
	_C.direcionalCima:addEventListener("touch", _C)


	_C.direcionalEsqurda = display.newImage(imagem)
	_C.direcionalEsqurda.x = centroX - (_C.direcionalCima.contentBounds.yMax - _C.direcionalCima.contentBounds.yMin)
	_C.direcionalEsqurda.y = _C.direcionalBaixo.y - (_C.direcionalBaixo.y - _C.direcionalCima.y) / 2
	_C.direcionalEsqurda:rotate(90)
	_C.direcionalEsqurda.direction = "esquerda"
	_C.direcionalEsqurda:addEventListener("touch", _C)

	_C.direcionalDireita = display.newImage(imagem)
	_C.direcionalDireita.x = centroX + (_C.direcionalCima.contentBounds.yMax - _C.direcionalCima.contentBounds.yMin)
	_C.direcionalDireita.y = _C.direcionalEsqurda.y
	_C.direcionalDireita:rotate(270)
	_C.direcionalDireita.direction = "direita"
	_C.direcionalDireita:addEventListener("touch", _C)

end

function _C:touch(event)
	if(event.phase == "began") then
		_M:moverPersonagem(event.target.direction)
	end
end

return _C