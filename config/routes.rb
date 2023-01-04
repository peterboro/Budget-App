Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :transactions, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  root to: 'splash#index'
end
