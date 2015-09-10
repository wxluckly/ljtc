Rails.application.routes.draw do
  devise_for :staffers
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  
  root 'welcome#index'

  resources :travels
  resources :areas

  namespace :ajax do
    post :like_travel, :share_weibo
  end

  namespace :sub do
    get :event_zero, :event_one, :event_two, :event_three, :event_four, :qa, :product
  end

  namespace :user do
    get :edit, :edit_avatar
    put :update, :update_avatar
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
