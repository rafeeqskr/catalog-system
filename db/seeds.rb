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


home_product = ProductType.where(type_name: 'Home').first_or_create
home_product.sub_product_types.where(type_name: 'Kitchen').first_or_create
home_product.sub_product_types.where(type_name: 'Dining').first_or_create
home_product.sub_product_types.where(type_name: 'Cleaning').first_or_create

office_product = ProductType.where(type_name: 'Office').first_or_create
office_product.sub_product_types.where(type_name: 'Furniture').first_or_create
office_product.sub_product_types.where(type_name: 'Rigistry').first_or_create

industry_product = ProductType.where(type_name: 'Industry').first_or_create
industry_product.sub_product_types.where(type_name: 'Factry').first_or_create
industry_product.sub_product_types.where(type_name: 'Michinary').first_or_create
