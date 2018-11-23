local _T = {id = nil, 
			imagem = nil, 
			direcao = nil, 
			tag = nil
		}

function _T:makeTronco(id, imagem, direcao, tag)
	local tronco = {}
	tronco.id = id
	tronco.imagem = imagem
	tronco.direcao = direcao
	tronco.tag = tag

	return tronco
end

function _T:construirTroncos()
	local troncos = {}
	local direcao = "esquerda"
	local posX, posY = largura - tamanhoPersonagem, tamanhoPersonagem / 2
	local quantTroncos = 6
	local posXtronco2 = posX

	for i = 1, quantTroncos do


		if(direcao == "esquerda") then
			direcao = "direita"
		else
			direcao = "esquerda"
		end

		if (posX > centroX) then
			posX = tamanhoPersonagem
			posXtronco2 = posX + (4 * tamanhoPersonagem)
		else
			posX = largura - tamanhoPersonagem
			posXtronco2 = posX - (4 * tamanhoPersonagem)
		end

		imagem = display.newRect(posX, _M.areaSegura2.area.contentBounds.yMax - (posY + tamanhoPersonagem), tamanhoPersonagem * 2, tamanhoPersonagem)
		imagem:setFillColor(0.6, 0.2, 0)
		tag = "tronco"

		local tronco1 = _T:makeTronco(i, imagem, direcao, tag)
		table.insert(troncos, tronco1)

		imagem = display.newRect(posXtronco2, _M.areaSegura2.area.contentBounds.yMax - (posY + tamanhoPersonagem), tamanhoPersonagem * 2, tamanhoPersonagem)
		imagem:setFillColor(0.6, 0.2, 0)

		local tronco2 = _T:makeTronco(quantTroncos + i, imagem, direcao, tag)
		table.insert(troncos, tronco2)
		posY = posY + tamanhoPersonagem
	end
	return troncos
end

function _T:moverTronco(tronco)
	-- calledMethod("tronco:movertroncos()")
	if(tronco.direcao == "direita") then
		tronco.imagem.x = tronco.imagem.x + tamanhoPersonagem
	elseif(tronco.direcao == "esquerda") then
		tronco.imagem.x = tronco.imagem.x - tamanhoPersonagem
	end
	if(tronco.imagem.x < 0 or tronco.imagem.x > largura) then
		self:resetTronco(tronco)
	end
end

function _T:resetTronco(tronco)
	if(math.fmod(tronco.id, 2) == 0) then
		tronco.imagem.x = largura
	else
		tronco.imagem.x = 0
	end
end

return _T