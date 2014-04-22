Ethioboston::Application.routes.draw do
  devise_for :users

  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy'
    post '/users/sign_up' => 'devise/registrations#new'
  end

  resources :users do 
    resources :call_lists, only: [:new, :create]
  end

  get '/dashboards' => 'dashboards#index', as: :user_root
 
   root 'welcome#index'

  resources :housings, only: [ :index, :show, :new, :create, :edit, :update ]
  resources :jobs, only: [ :index, :show, :new, :create, :edit , :update]
  resources :dashboards, only: [ :index ]
  resources :welcome, only: [ :index ]

  post 'twilio/voice' => 'twilio#voice'
  post '/jobs/new' => 'jobs#new'
  post '/housings/new' => 'housings#new'
  get "/users/:user_id/call_lists" => 'call_lists#new'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
