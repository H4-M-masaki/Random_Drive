Rails.application.routes.draw do


  # 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  root to: "public/homes#top"
  get '/about' => 'public/homes#about'


    namespace :admin do
    root to: "homes#top"

    resources :users, only: [:index, :show, :edit, :updete]

  end


  namespace :public do

    resources :users, only: [:show, :edit, :updete, :create]
    resources :posts, only: [:index, :new, :show, :edit, :destroy]


  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
