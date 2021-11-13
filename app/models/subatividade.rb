class Subatividade < ApplicationRecord
	belongs_to :atividade

	def completar
		self.completa = true
		self.save
	end

	def iniciar
		self.completa = false
		self.save
	end

	def esta_completa
		self.completa
	end

end
