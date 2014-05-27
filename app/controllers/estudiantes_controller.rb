class EstudiantesController < ApplicationController

	def login 
		@estudiante=Estudiante.new
	end

	def create_login_estudiante
		@cedula = params[:cedula]
		if (@cedula == '19967129' || @cedula=='20123445' || @cedula=='8318849')
			create_session_estudiante
			render 'estudiantes/menu'
		else
			flash[:notice] = "Cedula no registrada"
			render 'estudiantes/login'
		end
	end

	private
	def secure_params
		params.permit(:cedula)
	end


	private
	def create_session_estudiante
		session['autenticado'] = true

		if @cedula=='19967129'
			session['estudiante'] = 'Javier Velasquez' 
			session['cedula'] = '19967129'
		end

		if  @cedula=='20123445'
			session['estudiante'] = 'Mariangela Delgado'
			session['cedula'] = '20123445'
		end

		if  @cedula=='8318849'
			session['estudiante'] = 'Andrés Brito'
			session['cedula'] = '8318849'
			 
		end	
	end


end


