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
    resources :navlinks do
      get :move_up, :on => :member
      get :move_down, :on => :member
    end
  end

  root :to => "user_settings#show"
end
