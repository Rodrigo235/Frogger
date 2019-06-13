local _C = {}

function _C:makeControl()
	local imagem = "images/BotaoDirecional.png"

	_C.direcionalBaixo = display.newImage(imagem)
	_C.direcionalBaixo.x = centroX
	_C.direcionalBaixo.y = altura - ((_C.direcionalBaixo.contentBounds.yMax - _C.direcionalBaixo.contentBounds.yMin) * 1.5)
	_C.direcionalBaixo.direction = "baixo"

	_C.direcionalCima = display.newImage(imagem)
	_C.direcionalCima.x = centroX
	_C.direcionalCima.y = _C.direcionalBaixo.y - ((_C.direcionalCima.contentBounds.yMax - _C.direcionalCima.contentBounds.yMin))
	_C.direcionalCima:rotate(180)
	_C.direcionalCima.direction = "cima"

	_C.direcionalEsquerda = display.newImage(imagem)
	_C.direcionalEsquerda.x = centroX - (_C.direcionalCima.contentBounds.yMax - _C.direcionalCima.contentBounds.yMin)
	_C.direcionalEsquerda.y = _C.direcionalBaixo.y - (_C.direcionalBaixo.y - _C.direcionalCima.y) / 2
	_C.direcionalEsquerda:rotate(90)
	_C.direcionalEsquerda.direction = "esquerda"

	_C.direcionalDireita = display.newImage(imagem)
	_C.direcionalDireita.x = centroX + (_C.direcionalCima.contentBounds.yMax - _C.direcionalCima.contentBounds.yMin)
	_C.direcionalDireita.y = _C.direcionalEsquerda.y
	_C.direcionalDireita:rotate(270)
	_C.direcionalDireita.direction = "direita"

end

function _C:touch(event)
	if(event.phase == "began") then
		_M:moverPersonagem(event.target.direction, true)
	end
end

function _C:toFront()
	_C.direcionalBaixo:toFront( )
	_C.direcionalCima:toFront( )
	_C.direcionalEsquerda:toFront( )
	_C.direcionalDireita:toFront( )
end

function _C:addEvents ()
	_C.direcionalBaixo:addEventListener("touch", _C)
	_C.direcionalCima:addEventListener("touch", _C)
	_C.direcionalEsquerda:addEventListener("touch", _C)
	_C.direcionalDireita:addEventListener("touch", _C)
end

function _C:removeEvents()
	_C.direcionalBaixo:removeEventListener("touch", _C)
	_C.direcionalCima:removeEventListener("touch", _C)
	_C.direcionalEsquerda:removeEventListener("touch", _C)
	_C.direcionalDireita:removeEventListener("touch", _C)
end

return _C