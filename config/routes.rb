ScientificProfile::Application.routes.draw do |map|

  devise_for :users

  resources :pages
  resources :galleries do
    resources :images
  end

  resources :articles

  match "journals/autocomplete_form", :to => "journals#autocomplete_form"
  resources :journals do
    get "autocomplete_search", :on => :collection
  end


  resources :theses
  resources :books
  resources :book_chapters
  resources :publications
  resources :users
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
