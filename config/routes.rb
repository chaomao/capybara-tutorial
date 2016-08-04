Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    get 'top-10', on: :collection, action: :top_10
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
