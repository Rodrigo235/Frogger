local _P = {}

local padraoX, padraoY

function _P:makeFrogger()
	--calledMethod("_P:makeFrogger()")
	_P.character = display.newRect(centroX, centroY, tamanhoPersonagem, tamanhoPersonagem)
	_P.vidas = 3
	_P.textoVida = display.newText( tostring(_P.vidas), largura * 0.9, altura * 0.85, native.systemFontBold, 50)
	_P.tag = "player"

	_P.character:setFillColor(0, 0.75, 0)

	_P:show(false)
end

function _P:show(arg)
	calledMethod("_P:show("..tostring(arg)..")")
	_P.character.isVisible = arg
end

function _P:tirarVida()
	calledMethod("_P:tirarVida()")
	_P.vidas = _P.vidas - 1
	if(_P.vidas >= 0) then
		_P.textoVida.text = _P.vidas
	else
		_P:gameOver()
	end
	
end

function _P:die()
	calledMethod("_P:die()")
	_P:resetPosition()
	_P:tirarVida()
	return true
end

function _P:presetPosition(posX, posY)
	calledMethod("_P:presetPosition("..tostring(posX)..", "..tostring(posY)..")")
	if(padraoX == nil) then
		padraoX = posX
	end
	if(padraoY == nil) then
		padraoY = posY
	end
end

function _P:resetPosition()
	calledMethod("_P:resetPosition()")
	_P.character.x = padraoX
	_P.character.y = padraoY
end

function _P:resetCharacter()
	calledMethod("_P:resetCharacter()")
	_P:resetPosition()
	_P.vidas = 3
	_P.textoVida.text = tostring(_P.vidas)
	_P:show(true)
end

function _P:move(direction)
	--calledMethod("_P:move("..tostring(direction)..")")
	if(direction == "esquerda") then
		_P.character.x = _P.character.x - tamanhoPersonagem
	elseif(direction == "direita") then
		_P.character.x = _P.character.x + tamanhoPersonagem
	elseif(direction == "cima") then
		_P.character.y = _P.character.y - tamanhoPersonagem
	elseif(direction == "baixo") then
		_P.character.y = _P.character.y + tamanhoPersonagem
	end
end

function _P:getBounds()
	--calledMethod("_P:getBounds()")
	return _P.character.contentBounds
end

function _P:setX(posX)
	--calledMethod("_P:setX("..tostring(posX)..")")
	if(posX ~= nil) then
		if(posX >= 0) then
			_P.character.x = posX
		end
	end
end

function _P:setY(posY)
	--calledMethod("_P:setY("..tostring(posY)..")")
	if(posY ~= nil) then
		if(posY >= 0) then
			_P.character.y = posY
		end
	end
end

function _P:getTag()
	--calledMethod("_P:getTag()")
	return _P.tag
end

function _P:getX()
	--calledMethod("_P:getX()")
	return _P.character.x
end

function _P:getY()
	--calledMethod("_P:getY()")
	return _P.character.y
end

function _P:passarFase()
	--calledMethod("_P:passarFase()")
	_P.character = display.newRect(padraoX, padraoY, tamanhoPersonagem, tamanhoPersonagem)
	_P.character:setFillColor(0, 0.75, 0)
end

function _P:checarMorte(tag)
	--calledMethod("_P:checarMorte("..tostring(tag)..")")
	if(tag == "rio") then
		_P:die()
	end
	if(tag == "carro") then
		_P:die()
	end
	if(tag == "objetivo") then
		_P:passarFase()
	end
end

function _P:gameOver()
	--calledMethod("_P:gameOver()")
	_P:show(false)
end

return _P