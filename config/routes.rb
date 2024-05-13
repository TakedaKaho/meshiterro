Rails.application.routes.draw do
  devise_for :users #devise のモデルを作成したことによって勝手に追加された！
  root to: "homes#top"
  
  get 'homes/about' =>"homes#about", as: 'about'
  
end
  