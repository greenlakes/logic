Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users
  resources :categories
  resources :quizzes
  resources :plays, only: [:index, :show]
  
  post 'plays/check_results' => 'plays#check_results'
end
