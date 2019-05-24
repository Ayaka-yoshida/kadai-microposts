class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum:255 }
  
  has_many :favorites #favoritesテーブルと繋げる
  has_many :users, through: :favorites　# favoeiteモデル(＝テーブル？)を経由してuserテーブルと繋げる

 # お気に入り機能
  def micropostfavoriting(micropost)
      self.favorites.find_or_create_by(micropost_id: micropost.id)
  end
  
  def unfavoriting(micropost)
    favorite = self.favorites.find_by(micropost_id: micropost.id)
    favorite.destroy if favorite
  end
  
  def favoriting?(micropost)
    self.favorites.include?(micropost)
  end
end