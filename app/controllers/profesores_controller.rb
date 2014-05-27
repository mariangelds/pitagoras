class ProfesoresController < ApplicationController

	def login 
		@profesor = Profesor.new
	end

	def create_login_profesor
		@clave = params[:clave]
		if (@clave == '1234' || @clave=='4321' || @clave=='5678')
			create_session_profesor
			render 'profesores/menu'
		else
			flash[:notice] = "clave invalida"
			render 'profesores/login'
		end
	end

	def correo_masivo
		@profesor = Profesor.new
	end

	def logout
		session['autenticado'] = false
		session['profesor'] = nil
		session['materia'] = nil
		flash[:notice] ="Vuelva Pronto"
		render 'home/index'
	end

	private
	def secure_params
		params.permit(:contraseña)
	end

	private
	def create_session_profesor
		session['autenticado'] = true

		if @clave=='1234'
			session['profesor'] = 'Ana Karina Fernandez'
			session['materia'] = 'Base de Datos' 
		end

		if  @clave=='4321'
			session['profesor'] = 'Carlo Magurno'
			session['materia'] = 'Desarrollo del Software' 
		end

		if  @clave=='5678'
			session['profesor'] = 'Jose de Sousa'
			session['materia'] = 'Desarrollo del Software' 
		end	
	end

end