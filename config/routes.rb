Rails.application.routes.draw do

  devise_for :users #devise のモデルを作成したことによって勝手に追加された！
  root to: "homes#top"
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
  
  get 'homes/about' =>"homes#about", as: 'about'
  
end
  