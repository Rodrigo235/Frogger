composer = require ("composer")

largura, altura = display.actualContentWidth, display.actualContentHeight

centroX, centroY = display.contentCenterX, display.contentCenterY

-- valor do tamanho do personagem 32 --
tamanhoPersonagem = largura * 0.1

limiteMapa = nil

dificuldade = 1000

maiorFase = 0

faseAtual = 0

function calledMethod(metodo)
	print("Called Method ======== " ..tostring(metodo))
end

function subirFase()
	faseAtual = faseAtual + 1
end

function resetFase()
	faseAtual = 0
end

function getMaiorFase()
	if(faseAtual > maiorFase)then
		maiorFase = faseAtual
		resetFase()
	end
end

function subirDificuldade()
	dificuldade = dificuldade * 0.75
end

function resetDificuldade()
	dificuldade = 1000
end