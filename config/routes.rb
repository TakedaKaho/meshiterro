Rails.application.routes.draw do

  devise_for :users #devise のモデルを作成したことによって勝手に追加された！
  root to: "homes#top"
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resource :favorite, only: [:create, :destroy] #単数形にすると、/:idがURLに含まれなくなる
   resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  
  get 'homes/about' =>"homes#about", as: 'about'
  
end
  