Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  post '/new_item_search', to: 'items#new_item_search'
  get '/search', to: 'items#search'
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  namespace :api , defaults: {format: :json} do
    namespace :v1 do
      resources :items, only: [:index, :show, :destroy, :create]
    end
  end
end
