Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  

  mount ActionCable.server, at: '/cable'
end
