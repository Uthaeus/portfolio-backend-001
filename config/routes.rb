Rails.application.routes.draw do
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to:'pages#contact'
  get 'check_user', to: 'pages#check_user'
  
end
