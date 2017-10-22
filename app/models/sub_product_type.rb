class SubProductType < ApplicationRecord
  belongs_to :product_type
  has_many :products
end
