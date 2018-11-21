local _T = {velocidade = 10, 
			imagem = nil, 
			direcao = nil, 
			tag = nil
		}

function _T:newObject()
	return setmetatable( _T, obj )
end

function _T:construirCarros()
	local carro = {}
	local direcao = "esquerda"
	local posX, posY = largura - tamanhoPersonagem, tamanhoPersonagem / 2 

	for i = 1, 6 do

		carro[i] = _T:newObject()

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
	end

	function carro:moverCarros()
		calledMethod("carro:moverCarros()")

		-- carro[1].imagem.x = carro[1].imagem.x - tamanhoPersonagem
		-- carro[2].imagem.x = carro[2].imagem.x - tamanhoPersonagem / 6
		-- carro[3].imagem.x = carro[3].imagem.x - tamanhoPersonagem / 6
		-- carro[4].imagem.x = carro[4].imagem.x - tamanhoPersonagem / 6
		-- carro[5].imagem.x = carro[5].imagem.x - tamanhoPersonagem / 6
		-- carro[6].imagem.x = carro[6].imagem.x - tamanhoPersonagem / 6

	end
	return carro
end

return _T