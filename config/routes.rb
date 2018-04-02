Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names:
                 {
                   sign_in: 'login',
                   sign_out: 'logout',
                   edit: 'profile'
                 },
             controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :users, only: :show
  resources :rooms, path: 'annonces' do
    resources :reservations, only: :create
    resources :reviews, only: [:create, :destroy]
  end
  resources :photos
  resources :conversations, only: [:create, :index] do
    resources :messages, only: [:create, :index]
  end
  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  get '/mes_voyages' => 'reservations#your_trips', as: 'mes_voyages'
  get '/mes_reservations' => 'reservations#your_reservations', as: 'mes_reservations'
  get '/search' => 'pages#search'
end
