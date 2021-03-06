Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "menu#index"

  get "dashboard", to: "menu#show_dashboard", as: "menu_dashboard"
  post "dashboard", to: "menu#create_dashboard"
  get "demand", to: "menu#demand", as: "menu_demand"
  get "supply", to: "menu#supply", as: "menu_supply"
  get "product", to: "menu#product", as: "menu_product"
  get "warehouse", to: "menu#warehouse", as: "menu_warehouse"
  get "logistics", to: "menu#logistics", as: "menu_logistics"
  get "setup", to: "menu#setup", as: "menu_setup"

  devise_for :users, only: [:password, :sessions], path: ""
  devise_scope :user do
    get "sign_up", to: "devise/registrations#new", as: "new_user_registration"
  end
  devise_for :users, only: :registration, path: "", path_names: { registration: 'sign_up' }

  resources :companies
  resources :company_addresses
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

  patch "warehouses/change_status", to: "warehouses#change_status", as: "change_warehouse_status"
  resources :warehouses

  # resources :accounts

  resources :customers do
    resources :account_addresses
    resources :account_contacts
  end

  resources :suppliers do
    resources :account_addresses
    resources :account_contacts
  end

  # resources :account_addresses
  # resources :account_contacts

  resources :products

  resources :product_types

  patch "product_categories/change_status", to: "product_categories#change_status", as: "change_product_categories_status"
  resources :product_categories

  patch "product_groups/change_status", to: "product_groups#change_status", as: "change_product_groups_status"
  resources :product_groups

  patch "purchase_orders/change_status", to: "purchase_orders#change_status", as: "change_po_status"
  resources :purchase_orders

  patch "sales_orders/change_status", to: "sales_orders#change_status", as: "change_so_status"
  resources :sales_orders

  resources :inventories, only: [:index, :show]
  

end
