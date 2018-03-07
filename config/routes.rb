Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "menu#index"

  get "dashboard", to: "menu#show_dashboard"
  post "dashboard", to: "menu#create_dashboard"
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
  
  patch "payment_options/change_status", to: "payment_options#change_status", as: "change_payment_option_status"
  resources :payment_options, except: [:show]
  
  patch "payment_terms/change_status", to: "payment_terms#change_status", as: "change_payment_term_status"
  resources :payment_terms

  patch "freight_terms/change_status", to: "freight_terms#change_status", as: "change_freight_term_status"
  resources :freight_terms, except: [:show]

  patch "unit_of_measures/change_status", to: "unit_of_measures#change_status", as: "change_uom_status"
  resources :unit_of_measures, except: [:show]

  resources :accounts
  


end
