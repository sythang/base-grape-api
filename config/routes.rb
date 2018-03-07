Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
    root "dashboard#index"
  end

  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
