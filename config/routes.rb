Rails.application.routes.draw do
  root "reports#index"
  
  devise_for :users

  resources :periods
  resources :reports

  get "users/:id/edit" => "users#edit", as: :edit_user
  patch "users/:id" => "users#update", as: :user

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
