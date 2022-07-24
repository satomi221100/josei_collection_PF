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
  scope :book do
    post "/:id/favorites" => "favorites#create", as: 'favorites'
    delete "/favorite/:id" => "favorites#destroy", as: 'favorite'
    post "/:id/comments" => "book_comments#create", as: 'comments'
    delete "/comment/:id" => "book_comments#destroy", as: 'comment'
  end
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
