Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :works
      resources :collections
    end
  end
  root "controllers#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
