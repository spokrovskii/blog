Rails.application.routes.draw do
  get 'welcome/index'

  resources :posts

  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'welcome#index'

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
