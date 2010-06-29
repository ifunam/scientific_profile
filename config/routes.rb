ScientificProfile::Application.routes.draw do |map|
  devise_for :users

  resources :pages
  resources :galleries do
    resources :images
  end
  resource :user_settings
  
  namespace :admin do
    resources :users
  end

  root :to => "pages#index"
end
