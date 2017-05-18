Rails.application.routes.draw do
  post 'sessions/create'
  get 'sessions/show'
  delete 'sessions/destroy'

  resources :users
  root 'welcome#index'
  resources :notices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
