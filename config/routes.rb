Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'home/contactus'
  resources :products do
    get :sub_product_types, on: :collection
    get 'make_a_cover_photo/:photo_id' => 'products#make_a_cover_photo', as: :make_a_cover_photo
    delete 'remove_photo/:photo_id' => 'products#remove_photo', as: :remove_photo
  end
  resources :sub_product_types do
    post :add_product_type, on: :collection
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
