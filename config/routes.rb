Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  devise_scope :admin do
    get '/admin', to: 'devise/sessions#new'
  end

  namespace :api do
    resources :restaurants, only: [:index, :show]
    resource :user, only: [:show, :create]
    resources :days, only: [:index, :show]
    resources :selections, only: [:index, :show]
    resources :recipes, only: [:index, :show] do
      resources :steps, only: [:index, :show]
    end

    resources :tag_groups, only: [:index]
  end

  namespace :admin do
    resources :restaurants
    resources :days
    resources :selections
    resources :recipes do
      resources :steps, shallow: true
    end

    resources :tag_groups
  end
end
