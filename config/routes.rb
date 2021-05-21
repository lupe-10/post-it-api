Rails.application.routes.draw do
  resources :categories, only: %i[create destroy]
  resources :users, param: :_username
  resources :posts, only: %i[index show create update destroy]
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end