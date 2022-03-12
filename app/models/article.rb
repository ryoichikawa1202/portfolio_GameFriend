class Article < ApplicationRecord

  belongs_to :user
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
