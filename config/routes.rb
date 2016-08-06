Rails.application.routes.draw do
  namespace :api do
    resources :restaurants, only: [:index, :show]
    resource :user, only: [:show, :create]
    resources :categories, only: [:index, :show]

    resources :recipes, only: [:index, :show] do
      resources :steps, only: [:index, :show]
    end
  end

  namespace :admin do
    resources :restaurants
    resources :categories

    resources :recipes do
      resources :steps, shallow: true
    end
  end
end
