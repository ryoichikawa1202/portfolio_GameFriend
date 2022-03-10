Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  root to: "homes#top"

  resources :articles, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update]

  get '/users/:id/quit' => 'users#quit', as: 'quit'
  patch '/users/:id/out' => 'users#out', as: 'out'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
