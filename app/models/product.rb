class Product < ApplicationRecord
  belongs_to :maker
  belongs_to :sub_product_type
  has_one :product_type, through: :sub_product_type
  has_many :photos
  has_one :cover_photo, -> { where(main_image: true) }, class_name: 'Photo'

  scope :home_products, -> { where on_homepage: true }
  scope :product_name, -> (name){ where name: name }
  scope :color, -> (color){ where color: color }
  scope :code, -> (code){ where code: code }
  scope :maker, -> (maker_id){ where maker_id: maker_id }
  scope :category, -> (category){ joins(:product_type).where(product_types: {type_name: category}) }
  scope :sub_type, -> (type_name) { joins(:sub_product_type).where(sub_product_types: {type_name: type_name}) }
  include ProductSearch


  # after_save :set_cover_photo
  # accepts_nested_attributes_for :photos

  def set_cover_photo
    if photos.blank?
      self.build_cover_photo(image_url: 'http://placehold.it/400x300').save
    elsif cover_photo.blank?
      self.photos.first.update(main_image: true)
    end
  end
  def update_photos(photos)
    photos.each do |image|
      @product.photos.create(image: image)
    end
    set_cover_photo
  end
  def make_a_cover_photo(photo)
    self.cover_photo.update(main_image: false)
    photo.update(main_image: true)
  end
end
