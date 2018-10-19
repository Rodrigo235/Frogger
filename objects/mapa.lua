local _P = require "objects.personagem"

local _M = {}

function _M:makeMap()
	calledMethod("_M:makeMap()")
	_M.mapaCompleto = {
		area = display.newRect(centroX, centroY - tamanhoPersonagem, largura, tamanhoPersonagem * 15),
		tag = "mapa"
	}

	_M.areaSegura1 = {
		area = display.newRect( centroX, (_M.mapaCompleto.area.contentBounds.yMax - tamanhoPersonagem / 2), largura, tamanhoPersonagem),
		tag = "areaSegura"
	}

	_M.areaSegura2 = {
		area = display.newRect( centroX, (_M.mapaCompleto.area.contentBounds.yMax / 2 - tamanhoPersonagem / 2), largura, tamanhoPersonagem),
		tag = "areaSegura"
	}

	_M.areaObjetivo = {
		area = display.newRect( centroX, _M.mapaCompleto.area.contentBounds.yMin + tamanhoPersonagem  / 2, largura, tamanhoPersonagem),
		tag = "objetivo"
	}

	_M.areaEstrada = {
		area = display.newRect(centroX, _M.areaSegura1.area.contentBounds.yMin - ((_M.areaSegura1.area.contentBounds.yMin - _M.areaSegura2.area.contentBounds.yMax) / 2), largura, _M.areaSegura1.area.contentBounds.yMin - _M.areaSegura2.area.contentBounds.yMax),
		tag = "rua"
	}

	_M.areaRio = {
		area = display.newRect(centroX, _M.areaSegura2.area.contentBounds.yMin - ((_M.areaSegura2.area.contentBounds.yMin - _M.areaObjetivo.area.contentBounds.yMax) / 2), largura, _M.areaSegura2.area.contentBounds.yMin - _M.areaObjetivo.area.contentBounds.yMax),
		tag = "rio"
	}

	_M.areaSegura1.area:setFillColor(0.5, 0, 1)
	_M.areaSegura2.area:setFillColor(0.5, 0, 1)
	_M.areaEstrada.area:setFillColor(0.15, 0.15, 0.15)
	_M.areaRio.area:setFillColor(0, 0, 0.9)
	_M.areaObjetivo.area:setFillColor(1, 1, 0)
end

function _M:startGame()
	calledMethod("_M:startGame()")
	_M:makeMap()
	_P:makeFrogger()
	_P:presetPosition(centroX + tamanhoPersonagem / 2, _M.mapaCompleto.area.contentBounds.yMax - tamanhoPersonagem / 2)
	_P:resetCharacter()
end

function _M:setTag()
	calledMethod("_M:setTag()")
	if(_P:getY() < _M.areaObjetivo.area.contentBounds.yMax and _P:getY() > _M.areaObjetivo.area.contentBounds.yMin) then
		_P:checarMorte(_M.areaObjetivo.tag)
	end
	if(_P:getY() < _M.areaRio.area.contentBounds.yMax and _P:getY() > _M.areaRio.area.contentBounds.yMin) then
		_P:checarMorte(_M.areaRio.tag)
	end
end

function _M:moverPersonagem(direction)
	calledMethod("_M:moverPersonagem("..tostring(direction)..")")
	if (_M:podeMover(direction) == true) then
		_P:move(direction)
		_M:setTag()
	end
end

function _M:podeMover(direction)
	calledMethod("_M:podeMover("..tostring(direction)..")")
	local pBounds, mBounds = _P:getBounds(), _M.mapaCompleto.area.contentBounds

	if(direction == "baixo" and pBounds.yMax == mBounds.yMax) then
		return false 
	elseif(direction == "direita" and pBounds.xMax == mBounds.xMax) then 
		return false
	elseif(direction == "cima" and pBounds.yMin == mBounds.yMin) then 
		return false
	elseif(direction == "esquerda" and pBounds.xMin == mBounds.xMin) then 
		return false
	else
		return true
	end
end

return _M