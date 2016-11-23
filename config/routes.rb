Rails.application.routes.draw do
  
  devise_for :users
  resources :questions do
    resources :answers
  end
  resources :tests
  root 'welcome#index'

 
end
