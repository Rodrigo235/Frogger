local _O = {velocidade = 10, 
			imagem = nil, 
			direcao = nil, 
			tag = nil
		}

function _O:newObject()
	return setmetatable( _O, obj )
end

function _O:construirCarros()
	local carro = {}
	local direcao = "esquerda"
	local posX, posY = largura - tamanhoPersonagem, tamanhoPersonagem / 2 

	for i = 1, 6 do

		carro[i] = _O:newObject()

		if(direcao == "esquerda") then
			direcao = "direita"
		else
			direcao = "esquerda"
		end

		if (posX > centroX) then
			posX = tamanhoPersonagem
		else
			posX = largura - tamanhoPersonagem
		end

		carro[i].imagem = display.newRect(posX, limiteMapa.yMax - (posY + tamanhoPersonagem), tamanhoPersonagem * 2, tamanhoPersonagem)
		carro[i].direcao = direcao
		carro[i].tag = "carro"
		posY = posY + tamanhoPersonagem
		print(tostring(carro[i]))
	end

	function carro:moverCarros()
		for i = 1, #self do
			carro[i].imagem.x = carro[i].imagem.x + carro[i].velocidade
		end
	end
	return carro
end

return _O