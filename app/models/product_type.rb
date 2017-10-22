class ProductType < ApplicationRecord
  has_many :sub_product_types
  has_many :products, through: :sub_product_types
end
