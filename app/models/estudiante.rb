class Estudiante < ActiveRecord::Base
	has_no_table
	
	column :cedula, :string
	column :email, :string

	validates_presence_of :cedula , message: "Debe colocar una cedula"

	validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

	validate :verificar_cedula

	def  verificar_cedula
		if (:cedula != "19967129" && :cedula != "20123445" && :cedula != "8318849")
			errors.add(:cedula, "Cédula invalida")
		end

	end

end