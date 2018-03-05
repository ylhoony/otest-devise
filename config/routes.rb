Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "menu#index"

  get "dashboard", to: "menu#dashboard"
  get "demand", to: "menu#demand"
  get "supply", to: "menu#supply"
  get "product", to: "menu#product"
  get "warehouse", to: "menu#warehouse"
  get "logistics", to: "menu#logistics"
  get "setup", to: "menu#setup"

  devise_for :users, only: [:password, :sessions], path: ""
  devise_scope :user do
    get "sign_up", to: "devise/registrations#new", as: "new_user_registration"
  end
  devise_for :users, only: :registration, path: "", path_names: { registration: 'sign_up' }

  resources :companies
  resources :employees

  patch "currencies/change_status", to: "currencies#change_status", as: "change_currency_status"
  resources :currencies, only: [:index, :new, :create, :edit, :update]

  patch "countries/change_status", to: "countries#change_status", as: "change_country_status"
  resources :countries, only: [:index, :new, :create, :edit, :update]
  


end
