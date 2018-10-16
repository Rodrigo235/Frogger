local largura, altura = display.actualContentWidth, display.actualContentHeight
local tamanho = 30

local _P = 
{
	personagem = display.newRect(display.contentCenterX, altura * 0.85, tamanho, tamanho ),
	vidas = 3
}

_P.personagem:setFillColor(0, 0.75, 0)

function _P:show(arg)
	_P.personagem.isVisible = arg
end

function _P:morrer()
	_P:show(false)
	timer.performWithDelay(2500, _P:resetCharacter(), 1)
end

function _P:resetPosition()
	_P.personagem.x = display.contentCenterX
	_P.personagem.y = altura * 0.85
end

function _P:resetCharacter()
	_P:resetPosition()
	_P:show(true)
end

return _P