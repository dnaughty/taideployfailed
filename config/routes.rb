Rails.application.routes.draw do
  
  
  
  
  
  
  devise_for :users
  get 'landing/home'

  root 'landing#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :districts, shallow: true do
    resources :schools, shallow: true do
      resources :lessons, shallow: true do
            end
      resources :students
      resources :teachers
    end 
  end
  

end
