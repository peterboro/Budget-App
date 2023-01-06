Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  authenticated :user do
    root to: 'splash#index', as: :authenticated_root
  end

  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :transactions, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  root to: 'splash#index'
end
