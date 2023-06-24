Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to:'pages#contact'
  get 'check_user', to: 'pages#check_user'
  
end
