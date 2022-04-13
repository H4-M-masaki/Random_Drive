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


  namespace :public do
    get 'homes/top'
    get 'homes/about'
    resources :users, only: [:show, :edit, :updete, :create]
    resources :posts, only: [:index, :new, :show, :edit, :destroy]

    get 'posts/index'
    get 'posts/new'
    get 'posts/show'
    get 'posts/edit'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
