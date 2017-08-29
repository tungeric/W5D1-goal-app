Rails.application.routes.draw do
  resources :users do
    resources :user_comments, only: [:index]
  end
  resource :session
  resources :goals do
    resources :goal_comments, only: [:index]
  end
  resources :user_comments, except: [:index]
  resources :goal_comments, except: [:index]

end
