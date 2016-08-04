Rails.application.routes.draw do
  namespace :api do
    resources :restaurants, only: [:index, :show]
    resources :recipes, only: [:index, :show]
  end

  namespace :admin do
    resources :restaurants
    resources :recipes
  end
end
