module ApplicationHelper

	def nome_atividade_to_parametro(nome)
		nome.gsub(/_/,' ').gsub(/\s+$/,'').gsub(/\s+/,'_')
	end

	def parametro_to_nome_atividade(parametro)
		parametro.gsub(/_/,' ')
	end

end
