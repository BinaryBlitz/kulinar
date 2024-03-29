Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  devise_scope :admin do
    get '/admin', to: 'devise/sessions#new'
  end

  namespace :api do
    resources :restaurants, only: [:index, :show]
    resource :user, only: [:show, :create] do
      post 'authenticate_email', on: :collection
    end
    resources :days, only: [:index, :show]
    resources :selections, only: [:index, :show]
    resources :recipes, only: [:index, :show] do
      resources :steps, only: [:index, :show]
      resources :ratings, except: [:show, :new, :edit], shallow: true
    end

    resources :tag_groups, only: :index do
      resources :tags, only: :index
    end
    resources :ingredients, only: [:index]
  end

  namespace :admin do
    resources :restaurants
    resources :days
    resources :selections
    resources :users, only: [:index, :show]

    resources :recipes do
      resources :steps, shallow: true
    end

    resources :tag_groups
    resources :ingredients
    resources :categories
  end
end
