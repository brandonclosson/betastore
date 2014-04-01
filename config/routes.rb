Betastore::Application.routes.draw do
  resources :subscriptions

  root :to => 'subscriptions#new'

  get '/products' => 'products#index'

  namespace :admin do
    resources :products
  end
end
