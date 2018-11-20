local _O = {velocidade = 10, 
			imagem = nil, 
			direcao = nil, 
			tag = nil
		}

function _O:makeCar(velocidade, imagem, direcao, tag)
	local car = {}
	car.velocidade = velocidade
	car.imagem = imagem
	car.direcao = direcao
	car.tag = tag

	return car
end

function _O:construirCarros()
	local carros = {}
	local direcao = "esquerda"
	local posX, posY = largura - tamanhoPersonagem, tamanhoPersonagem / 2 

	for i = 1, 6 do

		

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

		imagem = display.newRect(posX, limiteMapa.yMax - (posY + tamanhoPersonagem), tamanhoPersonagem * 2, tamanhoPersonagem)
		tag = "carro"

		local carro = _O:makeCar(10, imagem, direcao, tag)

		posY = posY + tamanhoPersonagem
		table.insert(carros, carro)
	end
	return carros
end

function _O:moverCarro(carro)
	calledMethod("carro:moverCarros()")
	print(carro.direcao)

	if(carro.direcao == "direita") then
		carro.imagem.x = carro.imagem.x + tamanhoPersonagem
	elseif(carro.direcao == "esquerda") then
		carro.imagem.x = carro.imagem.x - tamanhoPersonagem
	end
end

return _O