Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users
#   devise_for :users,skip: [:passwords], controllers: {
#   registrations: "users/registrations",
#   sessions: 'users/sessions'
# }

  root to: "homes#top"
  get "home/about" => "homes#about", as: 'about'
  resources :books
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
