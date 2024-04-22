Rails.application.routes.draw do
  # get 'comments/create'
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/edit'
  # get 'posts/create'
  # get 'posts/update'
  # get 'posts/destroy'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:edit, :update]

  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create]
  end
  root to: 'posts#index'

  get "up" => "rails/health#show", as: :rails_health_check

end
