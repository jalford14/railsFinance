Rails.application.routes.draw do
  get 'welcome/index'

  resources :transactions
  
  root 'welcome#index'
end
