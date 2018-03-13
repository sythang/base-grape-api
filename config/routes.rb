Rails.application.routes.draw do
  devise_for :administrators, controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :users
  namespace :admin do
    resources :users
    resources :merchants
    get 'dashboard/index'
    root "dashboard#index"
  end

  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  mount Jinny::API => '/'
  mount GrapeSwaggerRails::Engine => '/documentation'
end
