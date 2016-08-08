Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  devise_scope :admin do
    get '/admin', to: 'devise/sessions#new'
  end

  namespace :api do
    resources :restaurants, only: [:index, :show]
    resource :user, only: [:show, :create]
    resources :recipes, only: [:index, :show] do
      resources :steps, only: [:index, :show]
    end
  end

  namespace :admin do
    resources :restaurants
    resources :recipes do
      resources :steps, shallow: true
    end
  end
end
