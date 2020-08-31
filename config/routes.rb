Rails.application.routes.draw do
  devise_for :users
root to: "items#index"
resources :items, only: [:new, :create, :index] do
  member do
    get 'show'
  end
end

end
