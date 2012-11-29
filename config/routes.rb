InitialRelease::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'

  post '/cart/add_to_cart' => "cart#add_to_cart", as: 'add_to_cart'
  get '/cart/conversion/:product/:quantity' => 'cart#conversion', as: 'cart_conversion'
  delete '/cart/destroy_cart_item/:product' => 'cart#destroy_cart_item', as: 'destroy_cart_item'
  get '/cart' => "cart#index"

  get '/find_products' => 'products#find_products', as: 'find_products'
  
  root to: 'homes#wellcom'#, id: Article.find_by_title('root').id
  resources :articles
  resources :catalogs do
    resources :products
  end

  resources :orders
  #resources :subscriptions
  #get "payment", to: "payment#checkout"

  match ':hiperlink' => "articles#show", :as => 'hiperlink'

end
