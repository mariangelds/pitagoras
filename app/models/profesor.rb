class Profesor < ActiveRecord::Base
	has_no_table

	column :contraseña, :string
	validates_presence_of :contraseña, message: "La contraseña no puede estar en blanco"

	validate :verificar_contraseña
	
	def asignarClave (clave)
		if ( clave != "1234" || clave != "4321" || clave != "5678")
			return false
		else
			def contraseña
				contraseña = clave
			end

			return true
		end
	end

	def  verificar_contraseña
		if ( :contraseña != "1234" || :contraseña != "4321" || :contraseña != "5678")
			errors.add(:contraseña, "Contraseña invalida")
		end

	end
end 