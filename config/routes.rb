Rails.application.routes.draw do
  devise_for :users
root to: "items#index"
resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :orders, only: [:create] do
  member do
    get 'index', to: 'orders#index'
  end
end

end
