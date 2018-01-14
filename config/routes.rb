Rails.application.routes.draw do
  resources :users do
		get 'posts/search/:query' => 'posts#search'
    resources :posts
  end

  get 'profile/:id' => 'application#home'
end
