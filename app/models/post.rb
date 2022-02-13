class Post < ApplicationRecord

  belongs_to :user
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  accepts_attachments_for :post_images, attachment: :image

  validates :title, presence: true
  validates :body, presence: true

end
