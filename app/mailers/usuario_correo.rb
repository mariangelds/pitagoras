class UsuarioCorreo < ActionMailer::Base
  default from: "do-not-reply@example.com"

  def contacto_email(contacto)
  	#OWNER_EMAIL email del propietario del site configurado con figaro
  	@suscripcion=contacto
	mail(to: ENV["OWNER_EMAIL"],from: @suscripcion.email ,:subject => "Nuevo Estudiante")
	mail(to: @suscripcion.email,from: ENV["OWNER_EMAIL"] ,:subject => "Pitagoras")
  end
end