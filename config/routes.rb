Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: :users, only: [:create, :delete] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  root to: 'home#index', as: "home"

  get "users" => "users#index", as: "all_users"

  post "sign_up" => "users#signup"

  post "/" => "home#open", as: "open"

  delete "/user/delete/:id" => "users#delete", as: "user_delete"

end
