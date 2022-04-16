Rails.application.routes.draw do

  # 顧客用
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  root to: "public/homes#top"
  get '/about' => 'public/homes#about'


  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
  end


  namespace :public do

    get "/users/quit" => "users#quit"
    patch "/users/out" => "users#out"


    resources :users, only: [:show, :edit, :update, :create]
    resources :posts, only: [:index, :new, :show, :edit, :destroy, :create, :update] do
      resources :post_comments, only: [:create]
    end
    resources :drives, only: [:new, :index, :edit, :update, :destroy, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
