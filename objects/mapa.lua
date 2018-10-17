local _P = require "objects.personagem"

local _M = {}

function _M:makeMap()
	calledMethod("_M:makeMap()")
	_M.mapaCompleto = {
		area = display.newRect(centroX, centroY - 45, largura-10, alturaSegura - 100),
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

	_M.areaSegura1.area:setFillColor(0.5,0,1)
	_M.areaSegura2.area:setFillColor(0.5,0,1)
	_M.areaEstrada.area:setFillColor(0.15,0.15,0.15)
	_M.areaRio.area:setFillColor(0,0,0.9)
	_M.areaObjetivo.area:setFillColor(1,1,0)
end

function _M:startGame()
	calledMethod("_M:startGame()")
	_M:makeMap()
	_P:makeFrogger()
	_P:presetPosition(centroX, _M.mapaCompleto.area.contentBounds.yMax - tamanhoPersonagem / 2)
	_P:resetCharacter()
end

return _M