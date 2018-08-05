Rails.application.routes.draw do
  
  root 'users#show'

  devise_for :user

  resource :user

  resources :users

=begin
  resources :photos

  resources :albums

  resources :user , shallow: true do
  	resources :photos, :albums
  end
=end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
