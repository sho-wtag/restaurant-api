Rails.application.routes.draw do
  get 'reservations/:restaurant_id' => 'reservations#index'
  resources :reservations
end
