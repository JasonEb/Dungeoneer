Rails.application.routes.draw do
  resources :projects do
    resources :areas
  end

  resources :areas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
