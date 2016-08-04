Rails.application.routes.draw do
  namespace :api do
    resources :restaurants, only: [:index, :show]
    resources :recipes, only: [:index, :show]
    resource :user, only: [:show, :create]
  end

  namespace :admin do
    resources :restaurants
    resources :recipes
  end
end
