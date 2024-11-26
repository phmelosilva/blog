Rails.application.routes.draw do
  root "articles#index"

  # Pega e mapeia todas as rotas relacionadas ao recurso artigo
  resources :articles 
end
