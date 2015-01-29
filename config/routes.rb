Rails.application.routes.draw do
  root 'pages#home'

  resources :legislators, only: [:index]
  resources :users, only: [:update, :show]

  namespace :api do
    namespace :v1 do
      resources :legislators, only: [:index]
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#create'

  get '/login' => redirect('/auth/facebook'), as: :login
  get '/logout' => 'sessions#destroy', as: :logout

  get 'code', to: redirect('https://github.com/VikiAnn/funding_congress')
end
