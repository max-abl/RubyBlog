Rails.application.routes.draw do
  
  # Comments
  resources :comments

  # Posts
  resources :posts
  get 'posts/:id/comments', to: 'posts#get_comments'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
