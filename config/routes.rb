Rails.application.routes.draw do
  namespace :public do
    get 'orders/new'
  end
  # root to: "homes#top"
  # get "home/about"=>"homes#about"
  get 'about' => 'public/homes#about'

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :admin do
    get 'admin/sign_out' => 'admin/sessions#destroy'
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: "homes#top"
    get "home/about"=> 'homes#about'
    resources :products, only: [:show, :index]

    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :orders
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete "all_destroy"   #パスが　all_destroy_cart_items_path, method: :delete
      end
    end
    get 'orders/log', to: 'public/orders#log'
    get 'orders/thanks', to: 'public/orders#thanks'

  end

  namespace :admin do
    get 'home/top'=>'homes#top'
    resources :products, only: [:new, :show, :index, :create, :edit, :update, :destroy]


    #hashimoto-branch
    resources :genres, only: [:index, :edit, :create, :update]

    resources :order_products, only: [:index, :show, :update]
    resources :customers
    resources :orders, only: [:show]
  end
end