Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [ :index, :show, :edit, :update ]
  get :profile, to: "users#profile"
  resources :projects do
    get :toggle_status, to: "projects#toggle_status"
    resources :reviews, only: [ :new, :create ]
    resources :applications, only: [ :new, :create, :index, :show, :destroy ]
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
  end

  post :accept, to: "applications#accept"
  post :reject, to: "applications#reject"
end
