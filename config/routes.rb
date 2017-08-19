Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'welcome/index'

  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'posts#index'

    resources :posts, only: [:index,
                           :show,
                           :new,
                           :edit,
                           :create,
                           :update,
                           :destroy] do
    resources :comments, only: [:index, :new, :create, :edit, :show, :destroy]
  end
end
