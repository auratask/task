Rails.application.routes.draw do
  
  get 'activity/index'

  get 'task_lists/new'

  get 'task_lists/show'

  get 'task_lists/edit'

  get 'task_lists/index'

  get 'taskks/new'

  get 'taskks/show'

  get 'taskks/edit'

  get 'taskks/index'

  devise_for :users
  resources :users
  root to: "users#index"
end
