Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "menu#index"

  get "dashboard", to: "menu#dashboard" 

  devise_for :users, only: [:password, :sessions], path: ""
  devise_scope :user do
    get "sign_up", to: "devise/registrations#new", as: "new_user_registration"
  end
  # devise_for :users, only: :registration[:edit]
  devise_for :users, only: :registration, path: "", path_names: { registration: 'sign_up' }


end
