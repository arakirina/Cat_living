class Post < ApplicationRecord
  
   belongs_to :user
   attachment :image
  
  # ！テーブルはまだ作ってないよ！
  
end
