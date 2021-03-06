Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'session#new'
  get 'logout', to: 'session#destroy'
  get 'signup', to:'session#signup'
  post 'signup', to:'session#create'
  post 'login', to:'session#login'
  post 'message' , to:'messages#create'
  mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
