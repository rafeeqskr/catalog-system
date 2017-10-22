# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin1 = User.where(name: 'admin1', email: 'admin1@demo.com', user_type: 'admin').first_or_initialize
admin1.password = '000000'
admin1.password_confirmation =  '000000'
admin1.save

(1..5).each do |i|
  Maker.where(name: Faker::Company.name).first_or_create
end

['Home & Kitchen', 'Clothing', 'Footwear', 'Industry'].each do |product_type|
  ProductType.where(type_name: product_type).first_or_create
end

ProductType.all.each do |product_type|
  (1..3).each do
    product_type.sub_product_types.where(type_name: Faker::Commerce.department).first_or_create
  end
end
SubProductType.all.each do |sub_type|
  (0..3).each do
    product = sub_type.products.where(name: Faker::Commerce.product_name).first_or_initialize
    product.qty = rand(100),
    product.maker = Maker.all.sample,
    product.color = Faker::Color.color_name,
    product.code = Faker::Commerce.promotion_code,
    product.on_homepage = [true, false].sample,
    product.price = Faker::Commerce.price,
    product.description = "#{product.name}, #{product.color}, #{product.code}"
    product.save
    (0..3).each do
      product.photos.create(image_url: Faker::Avatar.image(nil, "400x300"))
    end
  end
end
