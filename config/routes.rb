Rails.application.routes.draw do
  root "reports#index"
  
  devise_for :users

  resources :periods
  resources :reports

  get "users/:id/bench_status/edit" => "users#edit_bench_status", as: :edit_bench_status
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
