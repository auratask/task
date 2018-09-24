Rails.application.routes.draw do
  
  get 'activity/index'


  devise_for :users
  resources :users
  resources :task_lists
  resources :taskks
  root to: 'taskks#index'
end
