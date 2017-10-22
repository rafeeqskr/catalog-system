class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @products = Product.home_products
    @makers = Maker.select(:id, :name)
    @product_types = ProductType.select(:id, :type_name)
    @sub_product_types = SubProductType.select(:id, :type_name)
  end

  def contactus
  end
end
