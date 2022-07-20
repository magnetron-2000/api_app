Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :authentication do
    resource :registration, only: :create
    resource :sessions, only: :create
  end

  namespace :admin do
    resources :workers, only: :index
  end
end
