local _P = {}

local padraoX, padraoY
local imagem = "images/Frogger.png"

function _P:makeFrogger()
	--_P.character = display.newRect(centroX, centroY, tamanhoPersonagem, tamanhoPersonagem )
	_P.character = display.newImage(imagem)
	_P.vidas = 3
	_P.textoVida = display.newText( tostring(_P.vidas), largura * 0.9, altura * 0.85, native.systemFontBold, 50)
	_P.tag = "player"
	_P.ganhadores = display.newGroup()

	--_P.character:setFillColor(0, 0.75, 0)

	_P:show(false)
end

function _P:show(arg)
	_P.character.isVisible = arg
end

function _P:tirarVida()
	_P.vidas = _P.vidas - 1
	if(_P.vidas >= 0) then
		_P.textoVida.text = _P.vidas
	else
		_P:gameOver()
	end
	
end

function _P:die()
	_P:resetPosition()
	_P:tirarVida()
	return true
end

function _P:presetPosition(posX, posY)
	if(padraoX == nil) then
		padraoX = posX
	end
	if(padraoY == nil) then
		padraoY = posY
	end
end

function _P:resetPosition()
	_P.character.x = padraoX
	_P.character.y = padraoY
end

function _P:resetCharacter()
	_P:resetPosition()
	_P.vidas = 3
	_P.ganhadores = display.newGroup()
	_P.textoVida.text = tostring(_P.vidas)
	_P:show(true)
end

function _P:rotacionar(lado, isControl)
	if (isControl == true) then
		if(lado == "esquerda" and _P.character.rotation ~= 270) then
			_P.character.rotation = 270
		elseif(lado == "direita" and _P.character.rotation ~= 90) then
			_P.character.rotation = 90
		elseif(lado == "cima" and _P.character.rotation ~= 0) then
			_P.character.rotation = 0
		elseif(lado == "baixo" and _P.character.rotation ~= 180) then
			_P.character.rotation = 180
		end
	end
end

function _P:move(direction, isControl)
	if(direction == "esquerda") then
		_P.character.x = _P.character.x - tamanhoPersonagem
	elseif(direction == "direita") then
		_P.character.x = _P.character.x + tamanhoPersonagem
	elseif(direction == "cima") then
		_P.character.y = _P.character.y - tamanhoPersonagem
	elseif(direction == "baixo") then
		_P.character.y = _P.character.y + tamanhoPersonagem
	end
	
	self:rotacionar(direction, isControl)
end

function _P:getBounds()
	return _P.character.contentBounds
end

function _P:setX(posX)
	if(posX ~= nil) then
		if(posX >= 0) then
			_P.character.x = posX
		end
	end
end

function _P:setY(posY)
	if(posY ~= nil) then
		if(posY >= 0) then
			_P.character.y = posY
		end
	end
end

function _P:getTag()
	return _P.tag
end

function _P:setTag( tag )
	_P.tag = tag
end

function _P:getX()
	return _P.character.x
end

function _P:getY()
	return _P.character.y
end

function _P:passarFase()
	_P.ganhadores:insert(_P.character)
	--_P.character = display.newRect(padraoX, padraoY, tamanhoPersonagem, tamanhoPersonagem)
	--_P.character:setFillColor(0, 0.75, 0)
	_P.character = display.newImage(imagem, padraoX, padraoY)
	subirFase()
	subirDificuldade()
	_M:setTimer(dificuldade)
	_M:organizeLayout()
end

function _P:checarMorte()
	if(self:getTag() == "rio") then
		_P:die()
	end
	if(self:getTag() == "carro") then
		_P:die()
	end
	if(self:getTag() == "objetivo") then
		_P:passarFase()
	end
end

function _P:gameOver()
	_P:show(false)
	_M:gameOver()
end

return _P