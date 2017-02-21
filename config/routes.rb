Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'



  resources :pony_offers, only: [:index, :destroy]

  resources :bookings, except: [ :update, :edit ]

  resources :ponies do
    resources :pony_offers, only: [:new, :create, :show, :list ]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
