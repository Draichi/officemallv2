Rails.application.routes.draw do
  root "produtos#index"
  resources :produtos
  #rake routes no terminal. resoureces vai dar todos os paths para destroy, new, etc
end
