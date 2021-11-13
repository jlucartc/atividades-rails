class ApplicationController < ActionController::Base
	def index
		@atividades = Atividade.incompletas
	end

	def nova_atividade
	end

	def nova_subatividade
		@atividade = Atividade.find(params[:atividade_id])
	end

	def criar_atividade
		atividade = Atividade.new(nome: params[:nome])
		if atividade.save
			flash[:success] = "Atividade #{params[:nome]} criada com sucesso!"
		else
			flash[:success] = "Erro na criação da atividade #{params[:nome]}."
		end

		redirect_to index_path
	end

	def criar_subatividade
		atividade = Atividade.find(params[:atividade])
		subatividade = Subatividade.create(nome: params[:nome], atividade: Atividade.find(params[:atividade]))

		redirect_to index_path
	end

	def completar_atividade
		atividade = Atividade.find(params[:id])
		atividade.completar
		puts atividade.completa
		if atividade.completa
			flash[:success] = "Atividade finalizada com sucesso!"
		else
			flash[:danger] = "Não foi possivel completar atividade."
		end

		redirect_to index_path
	end

	def iniciar_atividade
		atividade = Atividade.find(params[:id])
		atividade.iniciar
		if !atividade.completa
			flash[:success] = "Atividade iniciada com sucesso!"
		else
			flash[:danger] = "Não foi possivel iniciar atividade."
		end

		redirect_to index_path
	end

	def completar_subatividade
		subatividade = Subatividade.find(params[:id])
		subatividade.completar
		if subatividade.completa
			flash[:success] = "Subatividade finalizada com sucesso!"
		else
			flash[:danger] = "Não foi possivel completar subatividade."
		end

		redirect_to index_path
	end

	def iniciar_subatividade
		subatividade = Subatividade.find(params[:id])
		subatividade.iniciar
		if !subatividade.completa
			flash[:success] = "Subatividade iniciada com sucesso!"
		else
			flash[:danger] = "Não foi possivel iniciar subatividade."
		end
	
		redirect_to index_path
	end

end
