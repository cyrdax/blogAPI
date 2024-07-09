Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :posts, only: [:create, :update, :destroy] do
      collection do
        get '', to: 'posts#user_index'
      end
    end
  end

  resources :posts, only: [:index, :show] do
    resources :links, only: [:index, :show, :create, :update, :destroy]
  end
end
