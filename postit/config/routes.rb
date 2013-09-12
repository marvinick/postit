PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy]
  
  resources :comments, except: [:destroy]
  
  resources :categories, only: [:new, :create]
end

