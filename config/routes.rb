Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root :to => "admin/welcome#index"

  namespace :admin do
    root :to => "welcome#index"

    resources :super_accounts
    resources :accounts
  end
end
