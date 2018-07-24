Rails.application.routes.draw do
  get 'welcome/index'

  resources :transactions
  resources :categories
    
  
  root 'welcome#index'
end
