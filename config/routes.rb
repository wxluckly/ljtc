Rails.application.routes.draw do
  devise_for :staffers
  devise_for :users
  
  root 'welcome#index'

  resources :travels

  namespace :user do
    root 'welcome#index'
    resources :travels
  end

  namespace :admin do
    root 'welcome#index'
    resources :travels
  end
end
