Rails.application.routes.draw do
  devise_for :staffers, controllers: { registrations: "staffers/registrations" }
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords" }
  
  root 'welcome#index'

  resources :travels
  resources :areas
  resources :comments

  namespace :ajax do
    post :like_travel, :share_weibo
  end

  namespace :sub do
    get :event_zero, :event_one, :event_two, :event_three, :event_four, :qa, :product, :rule, :sending_mail, :name_list
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
    resources :comments
    resources :travels do
      member do
        put :set_verified, :set_blocked, :set_unblocked
      end
      collection do
        get :rank
      end
    end
    resources :travels_actions
    resources :users
  end
end
