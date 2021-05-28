Rails.application.routes.draw do
  root "reports#index"
  
  devise_for :users

  # resources :periods     #commenting this out because I might use it later
  resources :reports, except: [:new]

  get "reports/:id/hide" => "reports#hide", as: :hide_report

  get "users/:id/edit" => "users#edit", as: :edit_user
  patch "users/:id" => "users#update", as: :user

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
