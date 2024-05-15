class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params) #paramsとは、フォームなどによって送られてきた情報（パラメーター）を取得するメソッド
    @post_image.user_id = current_user.id #@post_image.user_id→　[モデル名].[カラム名]という形で繋げると、保存するカラムの中身を操作できる。
    #current_user は、コードに記述するだけで、ログイン中のユーザーの情報を取得できる便利な記述.devise をインストールすることで使える.
    @post_image.save
    redirect_to post_images_path
  end 

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end
  
  
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
