Rails.application.routes.draw do
  devise_for :staffers
  devise_for :users
  
  root 'welcome#index'

  resources :travels

  namespace :user do
    root 'welcome#index'
    resources :travels do
      collection do
        get :draft, :done
      end
    end
  end

  namespace :admin do
    root 'welcome#index'
    resources :travels
  end
end
