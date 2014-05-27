Mascotas::Application.routes.draw do
  root to: 'home#index'

  #get "/pages/*id", to:'pages#show'

  #get "profesores/new"

  get "profesores/login"
  get "estudiantes/login"
  get "profesores/logout"
  get "archivos/cargar"
  get "profesores/correo_masivo"
  get "archivos/profesor_notas"
  get "archivos/estudiante_notas"
  get "estudiantes/menu"
  get "suscripciones/inicio"

  post"profesores/create_login_profesor", to: 'profesores#create_login_profesor'
  post"archivos/subir_archivo", to:'archivos#subir_archivo'

  post 'estudiantes/create_login_estudiante', to: 'estudiantes#create_login_estudiante'

  post 'suscripciones/createSuscripcion', to: 'suscripciones#createSuscripcion'
#resources :profesores, only: [:new,:login]
#resources :contactos, only: [:new, :create]
#resources :visitantes, only: [:new, :create]

#match 'profesores/new', to: 'profesores#new', via: [:get, :post]

end
