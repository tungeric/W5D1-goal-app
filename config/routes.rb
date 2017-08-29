Rails.application.routes.draw do
  get 'comments/new'

  get 'comments/create'

  get 'comments/edit'

  get 'comments/update'

  get 'comments/index'

  get 'comments/show'

  get 'comments/destroy'

  resources :users
  resource :session
  resources :goals
  resources :comments

end
