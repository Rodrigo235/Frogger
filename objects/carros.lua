local _C = {id = nil, 
			imagem = nil, 
			direcao = nil, 
			tag = nil
		}

function _C:makeCar(id, imagem, direcao, tag)
	local car = {}
	car.id = id
	car.imagem = imagem
	car.direcao = direcao
	car.tag = tag

	return car
end

function _C:construirCarros()
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
		imagem:setFillColor(0.8, 0.8, 0.8)
		tag = "carro"

		local carro = _C:makeCar(i, imagem, direcao, tag)

		posY = posY + tamanhoPersonagem
		table.insert(carros, carro)
	end
	return carros
end

function _C:moverCarro(carro)
	if(carro.direcao == "direita") then
		carro.imagem.x = carro.imagem.x + tamanhoPersonagem
	elseif(carro.direcao == "esquerda") then
		carro.imagem.x = carro.imagem.x - tamanhoPersonagem
	end
	if(carro.imagem.x < 0 or carro.imagem.x > largura) then
		self:resetCar(carro)
	end
end

function _C:resetCar(carro)
	if(math.fmod(carro.id, 2) == 0) then
		carro.imagem.x = largura
	else
		carro.imagem.x = 0
	end
end

return _C