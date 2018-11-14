Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pages, only: [:index]

  resources :therapists do
     resources :appointments
  end

  resources :categories, only: [:index, :show, :update, :create, :destroy]

  namespace :therapist do
    resources :appointments, except: [:new, :create, :show]
  end
end


# What we used in Click Lave
# devise_for :users
# root to: 'pages#home'
# resources :laundries do
#   resources :orders, only: [:new, :create]
# end
# resources :orders, only: [:index, :show]

# namespace :laundry do
#   resources :orders, only: [:index], as: "laundry_orders"
#   resources :orders, only: [:update]
# end
