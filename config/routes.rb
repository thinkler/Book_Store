Rails.application.routes.draw do
  devise_for :admins
  resources :categories do
    resources :books
  end
  resources :authors

  root 'static_pages#home'

  get 'search_book_list' => 'authors#book_select_list', as: :book_search_list
  get 'search_author_list' => 'books#author_select_list', as: :author_search_list

  post 'authors/:id' => 'authors#add_book'
  post 'book/:id' => 'books#add_author'


  delete 'authors/delete_book/:id' => 'authors#delete_book', as: :delete_book
  delete 'books/delete_author/:id' => 'books#delete_author', as: :delete_author

end
