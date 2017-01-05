Rails.application.routes.draw do
  
  get '/' => 'posts#index'
  get 'posts'  => 'posts#index'
  get 'posts/new'
  post 'posts' => 'posts#create'
  get 'posts/:post_id' => 'posts#show'
  get 'posts/:post_id/edit' => 'posts#edit'
  patch 'posts/:post_id' => 'posts#update'
  delete 'posts/:post_id' => 'posts#destroy'

  post 'posts/:post_id/comments' => 'comments#create'
  patch 'posts/:post_id/comments/:comment_id' => 'comments#update'
  delete 'posts/:post_id/comments/:comment_id' => 'comments#destroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
