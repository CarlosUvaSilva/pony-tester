Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  get 'search', to: "pages#search", as: "search"

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                   registrations: 'users/registrations' }

  root to: 'pages#home'



  resources :pony_offers, only: [:index, :destroy]
  resources :bookings, only: [:index, :show]



  resources :ponies do
    resources :pony_offers, only: [:new, :create, :list, :show ] do
      resources :bookings, except: [ :update, :edit, :index ]
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
