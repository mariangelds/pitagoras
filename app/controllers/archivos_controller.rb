class ArchivosController < ApplicationController

	def cargar
		@archivo=Archivo.new
	end

	def subir_archivo
		@archivo=Archivo.new(secure_params)
		subir=params[:archivo]
		if (@archivo.validar_extension(subir))
			materia = session["materia"]
			@archivo.subirArchivo(subir,materia)
			flash[:notice]= "Archivo subido exitosamente"
			render "profesores/menu"
		else
			flash[:notice]= "Extension de archivo invalido"
			render "archivos/cargar"
		end
	end

	def profesor_notas
		@archivo = Archivo.new
		materia = session["materia"]
		@archivo.leerNotasDeMiMateria(materia)
	end

	def estudiante_notas
		@archivo = Archivo.new
		cedula = session["cedula"]
		if (@archivo.validarCedula(cedula))
			@archivo.leerNotasCedula(cedula)
		else
			flash[:notice]="Usted no pertence a ninguna materia"
			render "estudiantes/menu"
		end
		
	end

	private
	def secure_params
		params.permit(:ruta)
	end

end