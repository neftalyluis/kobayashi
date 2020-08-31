Rails.application.routes.draw do
  namespace :admin do
    resources :attendances, only: %i[index create]
    resources :employees do
      post :check_in, on: :member
      post :check_out, on: :member
    end
  end

  resource :attendances, only: :index
end
