Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root to: "homes#top"

  resources :articles, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :article_comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get '/users/:id/quit' => 'users#quit', as: 'quit'
  patch '/users/:id/out' => 'users#out', as: 'out'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
