Rails.application.routes.draw do
  #post "/productos" => "productos#create"
  #get "productos/new" => "productos#new"
  #get "productos/:id/delete" => "productos#delete"
  #delete "/productos/:id" => "productos#delete", as: :producto
  resources :productos, only: [:new, :create, :destroy]
  get "/productos/buscar" => "productos#buscar", as: :buscar_producto
  root "productos#index"
end
