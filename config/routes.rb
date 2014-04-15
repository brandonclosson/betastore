Betastore::Application.routes.draw do
  resources :subscriptions

  root :to => 'subscriptions#new'

  get '/products' => 'products#index'

  namespace :admin do
    resources :products
    get '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
  end

end
