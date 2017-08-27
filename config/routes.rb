Rails.application.routes.draw do

devise_for :users do
 get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
end
  
  resources :users

  resources :payments, only: [:new, :create]

  resources :products do
    resources :comments
  end
  
  
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'
  
  post 'static_pages/thank_you'
  
  mount ActionCable.server => '/cable'
  
  
  root 'static_pages#landing_page'
  get 'static_pages/landing_page'
  #get '/products/:id', to: 'products#show'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
