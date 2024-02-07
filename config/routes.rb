Rails.application.routes.draw do
  resources :notes
  resource :users, only: [:create] # create users
  post '/login', to: 'users#login' # for login
  get '/auto_login', to: 'users#auto_login' # verify loginusing jwt
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
