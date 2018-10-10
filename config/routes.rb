Rails.application.routes.draw do
  
  get 'activity/index'
  get 'taskks/sort_by'


  devise_for :users
  resources :users
  resources :task_lists
  resources :taskks
  root to: 'taskks#index'
end
