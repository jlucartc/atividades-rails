class Atividade < ApplicationRecord
	has_many :subatividades, dependent: :delete_all

	scope :completas, -> {where(completa: true)}
	scope :incompletas, -> {where(completa: false)}

	def completar
		self.completa = true

		self.subatividades.each do |subatividade|
			self.completa = false if !subatividade.completa
		end

		self.save
	end

	def iniciar
		self.completa = false
		
		self.subatividades.each do |subatividade|
			subatividade.completa = false
		end

		self.save
	end

end