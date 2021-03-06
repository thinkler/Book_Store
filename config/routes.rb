Rails.application.routes.draw do

  devise_for :admins, :controllers => {:registrations => "registrations"}
  resources :admins, except: [:sign_up]

  resources :categories do
    resources :books
  end
  resources :authors
  resources :order_books, only: [:create, :update, :destroy]
  resources :carts
  
  root 'static_pages#home'

  get 'search_book_list' => 'authors#book_select_list', as: :book_search_list
  get 'search_author_list' => 'books#author_select_list', as: :author_search_list

  get 'search_result' => 'categories#search', as: :search

  post 'authors/:id' => 'authors#add_book'
  post 'book/:id' => 'books#add_author'


  delete 'authors/delete_book/:id' => 'authors#delete_book', as: :delete_book
  delete 'books/delete_author/:id' => 'books#delete_author', as: :delete_author

  get 'test' => 'static_pages#test'

end
