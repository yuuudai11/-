Rails.application.routes.draw do
  get 'books' => 'books#new', as: 'new_book'
  get 'books' => 'books#index', as: 'book_all'
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

  root to: 'homes#top'
  resources :books
end
