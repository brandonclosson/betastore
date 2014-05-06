Betastore::Application.routes.draw do
  root :to => 'products#index'

  get '/welcome' => 'static_pages#welcome'

  resources :customers
  get '/signup'        => 'customers#new', as: 'signup'
  post '/signup'       => 'customers#create'

  get '/login' => 'logins#new', as: 'login'
  post '/login' => 'logins#create'
  get    '/login' => 'logins#new',     as: 'login'
  post   '/login' => 'logins#create'
  delete '/logout' => 'logins#destroy', as: 'logout'
  get '/verify/:token' => 'customers#verify', as: 'verify_customer'

  resources :products

  namespace :admin do
    resources :products
    get '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
  end

end
