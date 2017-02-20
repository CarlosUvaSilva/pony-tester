Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'



  resources :pony_offers, except: [ :update, :edit ]

  resources :bookings, except: [ :update, :edit ]

  resources :ponies



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
