Rails.application.routes.draw do
  resources :coordinators
  resources :participants do
    collection do
      get :aggregate_count_by_dob
      get :aggregate_count_by_coordinator_and_gender
    end 
  end
  resources :registries
  resources :enrollments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
