local _O = {velocidade = 10, imagem = nil, direcao = nil, tag = nil}

function _O:newObject()
	return setmetatable( _O, obj )
end