Rails.application.routes.draw do

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  root to: 'static_pages#main', as: 'main'

  resources :users

  controller :sessions do
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end

  resources :services do
    resources :type_of_products do
      resources :products
    end
  end

  resources :debtors
  resources :orders

  controller :static_pages do
    get :main
    get :about
    get :contacts
    get :production
  end
end
