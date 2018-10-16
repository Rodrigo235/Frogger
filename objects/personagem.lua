local largura, altura = display.actualContentWidth, display.actualContentHeight
local tamanho = 30

local _P = {personagem = display.newRect( display.contentCenterX , altura * 0.85, tamanho, tamanho ), vida = 3}

function _P:show(boolean)
	_P.personagem.isVisible = true
end

return _P

