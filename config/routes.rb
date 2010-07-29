ScientificProfile::Application.routes.draw do |map|
  devise_for :users

  resources :pages
  resources :galleries do
    resources :images
  end
  resources :articles
  resources :theses
  resources :books
  resources :book_chapters
  resources :publications
  resource :user_settings

  namespace :admin do
    resources :users
  end

  root :to => "user_settings#show"
end
