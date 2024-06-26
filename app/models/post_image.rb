class PostImage < ApplicationRecord
     has_one_attached :image
     belongs_to :user #"belongs to〜"とは、直訳すると「〜に属する」という意味 9章
     #PostImage モデルに関連付けられるのは、1 つの User モデルです。
      #このため、単数形の「user」になっている点に注意。
      
      has_many :post_comments, dependent: :destroy #1つの投稿画像に対し複数コメントできるから
      has_many :favorites, dependent: :destroy
      
      
       validates :shop_name, presence: true
       validates :image, presence: true
      
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
