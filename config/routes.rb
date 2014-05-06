Betastore::Application.routes.draw do

  get '/welcome' => 'static_pages#welcome'

  namespace :admin do
    resources :products
    get '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
  end

  resources :customers
  get '/signup'        => 'customers#new', as: 'signup'
  post '/signup'       => 'customers#create'

  get    '/login' => 'logins#new',     as: 'login'
  post   '/login' => 'logins#create'
  delete '/logout' => 'logins#destroy', as: 'logout'
  get '/verify/:token' => 'customers#verify', as: 'verify_customer'

  resources :products
  resources :orders
  resource :cart, only: [:update, :show, :delete]
  post '/products/:product_id/add_to_cart' => 'carts#create', as: 'add_product_to_cart'
  post '/products/:product_id/remove_from_cart' => 'carts#destroy', as: 'remove_product_from_cart'
end
