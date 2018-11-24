_M = {}

local _P = require "objects.personagem"
local _C = require "objects.carros"
local _T = require "objects.troncos"
local Controls = require "objects.controles"

function _M:makeMap()
	_M.mapaCompleto = {
		area = display.newRect(centroX, centroY - tamanhoPersonagem, largura, tamanhoPersonagem * 15),
		tag = "mapa"
	}

	limiteMapa = _M.mapaCompleto.area.contentBounds

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
	_M:makeMap()
	_M.carros = _C:construirCarros()
	_M.troncos = _T:construirTroncos()
	_P:makeFrogger()
	_P:presetPosition(centroX + tamanhoPersonagem / 2, _M.mapaCompleto.area.contentBounds.yMax - tamanhoPersonagem / 2)
	_P:resetCharacter()
	Controls:makeControl()
	Controls:addEvents()
	dificuldade = 1000
	frames = timer.performWithDelay(dificuldade, _M, 0)
end

function _M:touch( event )
	if(event.phase == "began") then
		if(event.target.text == "Reiniciar") then
			_M:restartGame()
		end
		if(event.target.text == "Menu") then
			_M:destroyAll()
			composer.gotoScene("cenas.menu", {effect = "fade"})
		end
	end
end

function _M:restartGame()
	display.remove(_M.textoGameOver)
	self:restartTimer()
	display.remove(_P.ganhadores)
	_P:resetCharacter()
	Controls:toFront()
	Controls:addEvents()
	faseAtual = 1
end

function _M:setTag()
	local isTronco = false
	frames.param = nil
	if(_P:getY() < _M.areaObjetivo.area.contentBounds.yMax and _P:getY() > _M.areaObjetivo.area.contentBounds.yMin) then
		_P:checarMorte(_M.areaObjetivo)
	end
	for i = 1, #_M.troncos do
		if (_P:getY() == _M.troncos[i].imagem.y and _P:getX() < _M.troncos[i].imagem.contentBounds.xMax and _P:getX() > _M.troncos[i].imagem.contentBounds.xMin) then
			isTronco = true
			frames.param = _M.troncos[i]
			_P:checarMorte(_M.troncos[i])
		end
	end
	if(isTronco == false) then
		if(_P:getY() < _M.areaRio.area.contentBounds.yMax and _P:getY() > _M.areaRio.area.contentBounds.yMin) then
			_P:checarMorte(_M.areaRio)
		end
	end
	for i = 1, #_M.carros do
		if (_P:getY() == _M.carros[i].imagem.y and _P:getX() < _M.carros[i].imagem.contentBounds.xMax and _P:getX() > _M.carros[i].imagem.contentBounds.xMin) then
			_P:checarMorte(_M.carros[i])
		end
	end
	
end

function _M:moverPersonagem(direction)
	if (_M:podeMover(direction) == true) then
		_P:move(direction)
		_M:setTag()
	end
end

function _M:organizeLayout()
	Controls:toFront()
end

function _M:podeMover(direction)
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

function _M:gameOver()
	Controls:removeEvents()
	if(faseAtual > maiorFase) then
		maiorFase = faseAtual
		faseAtual = 1
	end
	_M.textoGameOver = display.newGroup( )

	local texto = display.newText( "Game Over", centroX, altura * 0.2, "Comic Sans MS", 55)

	local textoReiniciar = display.newText( "Reiniciar", centroX, altura * 0.3, "Comic Sans MS", 55)
	textoReiniciar:setFillColor(1, 0, 0)
	textoReiniciar:addEventListener("touch", _M)

	local textoSair = display.newText( "Menu", centroX, altura * 0.4, "Comic Sans MS", 55)
	textoSair:setFillColor(1, 0, 0)
	textoSair:addEventListener("touch", _M)

	_M.textoGameOver:insert(texto)
	_M.textoGameOver:insert(textoSair)
	_M.textoGameOver:insert(textoReiniciar)

	timer.pause(frames)
end

function _M:timer(event)
	for i = 1, #_M.carros do
		_C:moverCarro(_M.carros[i])
		_T:moverTronco(_M.troncos[i])
		_T:moverTronco(_M.troncos[#_M.carros + i])
	end
	if(event.source.param) then
		if(event.source.param.tag == "tronco") then
			_M:moverPersonagem(event.source.param.direcao)
		end
	end
	_M:setTag()
end

function _M:restartTimer()
	if (frames) then
		timer.cancel(frames)
	end
	dificuldade = 1000
	frames = timer.performWithDelay( dificuldade, _M, 0)
end

function _M:setTimer(delay)
	if (frames) then
		timer.cancel(frames)
	end
	frames = timer.performWithDelay( delay, _M, 0)
end

function _M:destroyAll()
	display.remove(_M.textoGameOver)
	display.remove(_M.mapaCompleto.area)
	display.remove(_M.areaSegura1.area)
	display.remove(_M.areaSegura2.area)
	display.remove(_M.areaObjetivo.area)
	display.remove(_M.areaEstrada.area)
	display.remove(_M.areaRio.area)
	display.remove(_P.character)
	display.remove(_P.textoVida)
	display.remove(_P.ganhadores)
	for i = 1, #_M.carros do
		display.remove(_M.carros[i].imagem)
		display.remove(_M.troncos[i].imagem)
		display.remove(_M.troncos[i + #_M.carros].imagem)
	end
	Controls:removeEvents()
	display.remove(Controls.direcionalCima)
	display.remove(Controls.direcionalBaixo)
	display.remove(Controls.direcionalDireita)
	display.remove(Controls.direcionalEsquerda)
end

return _M