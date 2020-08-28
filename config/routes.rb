Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show]
  get :profile, to: "users#profile"
  resources :projects do
    #r remember to nest reveiew here
    resources :applications, only: [:new, :create, :index, :show, :destroy]
  end

  post "accept", to: "applications#accept"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
