Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope "(:locale)", locale: /en|vi|ja/ do
    root 'static_pages#home'

    devise_for :users, skip: :omniauth_callbacks
    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
      get 'register', to: 'devise/registrations#new'
      delete 'logout', to: 'devise/sessions#destroy'
    end

    # Sidekiq web
    require "sidekiq/web"
    authenticate :user, -> (user) {user.admin?} do
      mount Sidekiq::Web => "/sidekiq"
    end
  end
end
