local sqlite3 = require "sqlite3"

local database = {}

local path = system.pathForFile("data.db", system.DocumentsDirectory)
local db = sqlite3.open( path )

local criarTabela = [[CREATE TABLE IF NOT EXISTS MaiorFase (fase INTEGER);]]
db:exec(criarTabela)

function database:getValue()
	for row in db:urows('SELECT fase FROM MaiorFase') do
		return row
	end
	return 0
end

function database:insert(maiorFase)
	local script
	if(self:getValue() > 0) then
		script = [[UPDATE MaiorFase SET fase = ']]..maiorFase..[[';]]
	else
		script = [[INSERT INTO MaiorFase (fase) VALUES (]]..maiorFase..[[);]]
	end
	db:exec(script)
end

function database:close()
	db:close()
end

return database