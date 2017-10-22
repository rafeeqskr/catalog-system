class Photo < ApplicationRecord
  belongs_to :product
  dragonfly_accessor :image 
end
