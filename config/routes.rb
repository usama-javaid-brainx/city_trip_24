Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "locations#index"

  resources :locations, except: :index do
    get :coordinates_address, on: :collection
  end

  resources :sub_categories, only: [] do
    get :selected, on: :collection
  end
end
