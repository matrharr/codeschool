Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: "pages#home"

  resources :categories do
    resources :posts, except: [:new, :create, :edit, :update]
  end

  # get '/posts/new' => 'posts#new'
  # get '/posts/:id/edit' => 'posts#edit'
  # post '/posts' => 'posts#create'
  # patch '/posts/:id' => 'posts#update'
  resources :posts


  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/about' => 'pages#about'
  get '/home' => 'pages#home'
  get '/terms' => 'pages#terms'
  
end
