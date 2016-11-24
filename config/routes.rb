Rails.application.routes.draw do
  
  devise_for :users
  resources :questions do
    resources :answers
  end
  resources :tests
  root 'welcome#index'
  get '/file', to: 'welcome#file'
  post '/upload', to: 'welcome#upload'

 
end
