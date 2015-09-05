Rails.application.routes.draw do
  devise_for :staffers
  devise_for :users
  
  root 'welcome#index'

  resources :travels
  resources :areas

  namespace :ajax do
    post :like_travel, :share_weibo
  end

  namespace :sub do

  end

  namespace :user do
    root 'welcome#index'
    get :edit
    put :update
    resources :travels do
      collection do
        get :draft, :done
      end
    end
  end

  namespace :admin do
    root 'welcome#index'
    resources :travels do
      member do
        put :set_verified, :set_blocked, :set_unblocked
      end
      collection do
        get :rank
      end
    end
    resources :users
  end
end
