Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'
  resources :blogs do
    resources :comments
  end

  delete 'blogs/destroy_all', to: 'blogs#destroy_all', as: :delete_all
end
