Betastore::Application.routes.draw do
  root :to => 'static_pages#welcome'

  get '/signup'        => 'customers#new', as: 'signup'
  post '/signup'       => 'customers#create'
  get '/login'         => 'logins#new', as: 'login'
  post '/login'        => 'logins#create'
  get '/verify/:token' => 'customers#verify', as: 'verify_customer'

  get '/products' => 'products#index'

  namespace :admin do
    resources :products
    get '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
  end

end
