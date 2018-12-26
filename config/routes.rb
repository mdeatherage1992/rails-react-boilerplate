Rails.application.routes.draw do
  get 'home/index'
  get 'home/timestamp'
  root 'home#index'
  resources :strains do
    resources :batches
  end

  namespace :api do
  resources :strains do
    resources :batches
  end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
