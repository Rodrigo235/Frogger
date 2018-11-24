composer = require ("composer")

largura, altura = display.actualContentWidth, display.actualContentHeight

centroX, centroY = display.contentCenterX, display.contentCenterY

tamanhoPersonagem = largura * 0.1

limiteMapa = nil

dificuldade = 1000

maiorFase = 1

faseAtual = 1

function calledMethod(metodo)
	print("Called Method ======== " ..tostring(metodo))
end