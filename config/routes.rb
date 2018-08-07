Rails.application.routes.draw do
  root 'feeds#index'

  get '/feeds', to: "feeds#index"

  devise_for :user

  resource :user

  resources :users

  resources :photos

  resources :albums

  scope '/user' do
    resources :photos, :albums
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
