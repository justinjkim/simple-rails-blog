Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root - <controller name>#<controller method>
  root 'posts#index', as: 'home'

  # example of regular route
  # GET <url after the root> => '<controller>#<controller method>'
  get 'about' => 'pages#about', as: 'about'

  # resources
  resources :posts do 
    resources :comments # this is nested within posts, so you'll get something like /posts/1/comments
  end
end
