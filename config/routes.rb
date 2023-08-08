Rails.application.routes.draw do
  resources :coordinators
  resources :participants
  resources :registries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
