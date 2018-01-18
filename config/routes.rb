Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  devise_for :users
  root 'recipes#index'
  get 'recipes/all' => 'recipes#search_all'
  get 'recipes/show'
  post 'recipes/all'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
