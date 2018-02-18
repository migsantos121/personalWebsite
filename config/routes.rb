Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
  resources :homepage, only: [:index]
  resources :messages, only: [:index, :create] do
    collection do
      post :enter_room
    end
  end
  root to: 'homepage#index'
end
