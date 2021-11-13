Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/nova_atividade', to: "application#nova_atividade", as: "nova_atividade"
  get '/nova_subatividade/:atividade_id', to: "application#nova_subatividade", as: "nova_subatividade"
  get '/completar_atividade/:id', to: "application#completar_atividade", as: "completar_atividade"
  get '/completar_subatividade/:id', to: "application#completar_subatividade", as: "completar_subatividade"
  get '/iniciar_atividade/:id', to: "application#iniciar_atividade", as: "iniciar_atividade"
  get '/iniciar_subatividade/:id', to: "application#iniciar_subatividade", as: "iniciar_subatividade"
  post '/criar_atividade', to: "application#criar_atividade", as: "criar_atividade"
  post '/criar_subatividade', to: "application#criar_subatividade", as: "criar_subatividade"
  get '/', to: "application#index", as: "index"
end
