Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'welcome#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :welcome
    resources :likes
    resources :playlists
    resource  :comments  
    resource  :subscriptions do
      post '/update_subcription', to: 'subscriptions#update_subcription'
      get '/pay', to: 'subscriptions#pay'
    end

end
