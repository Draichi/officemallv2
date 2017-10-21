Rails.application.routes.draw do
  root "produtos#index"
  resources :produtos, only: [:new, :destroy, :create]
  #rake routes no terminal. resoureces vai dar todos os paths para destroy, new, etc
  get "/produtos/busca" => "produtos#busca", as: :busca_produto
end
