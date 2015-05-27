Rails.application.routes.draw do
  devise_for :admins
  resources :categories do
    resources :books
  end
  resources :authors
end
