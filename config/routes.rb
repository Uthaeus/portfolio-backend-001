Rails.application.routes.draw do
  resources :portfolio_comments
  resources :portfolio_items
  resources :blog_comments
  resources :categories
  resources :blogs
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to:'pages#contact'
  get 'check_user', to: 'pages#check_user'
  
end
