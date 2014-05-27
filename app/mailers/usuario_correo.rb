class UsuarioCorreo < ActionMailer::Base
  default from: "do-not-reply@example.com"

  def contacto_email(contacto)
  	#contacto.emael es el email del visitante
  	#OWNER_EMAIL email del propietario del site configurado con figaro
  	@suscripcion=contacto
  	if (@suscripcion.materia == 1)
		mail(to: ENV["OWNER_EMAIL"],from: @suscripcion.email,:subject => "Bienvenido estudiante de Base de Datos")
	end
	if (@suscripcion.materia == 2)
		mail(to: ENV["OWNER_EMAIL"],from: @suscripcion.email,:subject => "Bienvenido estudiante de Desarrollo del Software")
	end

	if (@suscripcion.materia == 3)
		mail(to: ENV["OWNER_EMAIL"],from: @suscripcion.email,:subject => "Bienvenido estudiante de Ruby On Rails")
	end

  end
end