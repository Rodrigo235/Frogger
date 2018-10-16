local largura, altura = display.actualContentWidth, display.actualContentHeight
local tamanho = 30

local _P = 
{
	character = display.newRect(display.contentCenterX, altura * 0.85, tamanho, tamanho ),
	vidas = 3
}

_P.character:setFillColor(0, 0.75, 0)

function _P:show(arg)
	_P.character.isVisible = arg
end

function _P:die()
	_P:show(false)
	timer.performWithDelay(2500, _P:resetCharacter(), 1)
end

function _P:resetPosition()
	_P.character.x = display.contentCenterX
	_P.character.y = altura * 0.85
end

function _P:resetCharacter()
	_P:resetPosition()
	_P:show(true)
end

function _P:move(direction)
	if(direction == "left") then
		_P.character.x = _P.character.x - tamanho
	elseif(direction == "right") then
		_P.character.x = _P.character.x + tamanho
	elseif(direction == "up") then
		_P.character.y = _P.character.y - tamanho
	elseif(direction == "down") then
		_P.character.y = _P.character.y + tamanho
	end
end

function _P:getBounds()
	return _P.character.contentBounds
end



return _P