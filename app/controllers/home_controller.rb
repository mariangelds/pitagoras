class HomeController < ApplicationController

	def index
		flash[:notice] = 'Bienvenido a Pitagoras!'
	end

end