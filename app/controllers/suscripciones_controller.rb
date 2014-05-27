class SuscripcionesController < ApplicationController

	def new
		@materia= Array.new
		@materia= [['Base de Datos', 0], ['Desarrollo de Softaware', 1], ['Ruby On Rails', 2]]
		@suscripcion= Suscripcion.new
		
	end

	def createSuscripcion 
		@suscripcion= Suscripcion.new(secure_params)
		if @suscripcion.valid?
			if (@suscripcion.materia == '1')
				@suscripcion.suscribete_base
			end
			if (@suscripcion.materia == '2')
				@suscripcion.suscribete_desarrollo
			end

			if (@suscripcion.materia == '3')
					@suscripcion.suscribete_ruby
			end

			UsuarioCorreo.contacto_email(@suscripcion).deliver
			flash[:notice] = "Registrado #{@suscripcion.email} en nuestra lista de correos"
			render 'estudiantes/menu'
		else
			flash[:notice] = "No se pudo suscribir"
			render 'estudiantes/menu'
		end
	end

	private 
	def secure_params
		params.permit(:nombre,:apellido,:cedula,:materia,:email)
	end

	private
	def tipo_suscripcion_materia(materia)
		if (materia == 1)
			@suscripcion.suscribete_base
		else
			if (materia == 2)


			else (materia == 3)

			end
		end
	end


end