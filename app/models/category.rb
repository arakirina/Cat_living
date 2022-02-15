class Category < ApplicationRecord

  belongs_to :post, optional: true

end
