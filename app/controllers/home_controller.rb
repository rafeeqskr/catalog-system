class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @products = Product.home_products
  end

  def contactus
  end
end
