Rails.application.routes.draw do

  # get 'sessions/new'
  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'
  get '/signup' => 'signups#new'
  get '/editing' => 'courses#editing'

  # get '/instructors/:id', to: 'instructors#individualprofile', as: 'individual'
  get '/individual' => 'courses#instructor'
  resources :charges
  resources :sessions
  resources :courses do
    resources :customer_courses, only: [:create]
  end
  resources :customers
  resources :instructors


  # get 'home/index'
  # root 'sessions#new'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
