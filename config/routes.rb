Rails.application.routes.draw do
  root 'sales#index'
  get 'sales' => 'sales#index'
  post 'shops/:shop_id/sales/' => 'sales#update'
  resources :products do 
    resources :sales
  end
  resources :shops do
    resources :sales
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
