class Post < ApplicationRecord

  belongs_to :user
  
  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image
  
  has_many :categories, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  
end
