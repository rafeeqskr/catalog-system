class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_admin?, only: [:new, :create, :update, :delete]
  before_action :set_product, only: [:show, :edit, :update, :destroy, :make_a_cover_photo, :remove_photo]

  def index
    @products = Product.search(filter_params)
  end

  def show
  end

  def new
    @product = Product.new
    @makers = Maker.select(:id, :name)
    @product_types = ProductType.select(:id, :type_name)
    
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        @product.update_photos(params[:product][:photos_attributes][:image]) if params[:product][:photos_attributes].present?
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    @makers = Maker.select(:id, :name)
    @product_types = ProductType.select(:id, :type_name)
  end

  def update
    respond_to do |format|
      @product.update(product_params)
      @product.update_photos(params[:product][:photos_attributes][:image]) if params[:product][:photos_attributes].present?

      format.html { redirect_to edit_product_url(@product) }
    end
  end

  def destroy
  end
  def make_a_cover_photo
    photo = @product.photos.where(id: params[:photo_id]).first
    @product.make_a_cover_photo(photo)
    redirect_to edit_product_url(@product)
  end
  def remove_photo
    @product.photos.where(id: params[:photo_id]).first.destroy
    redirect_to edit_product_url(@product)
  end
  def sub_product_types
    render json: SubProductType.where(product_type_id: params[:product_type_id]).select(:id, :type_name)
  end

  private
  def set_product
    @product = Product.find(params[:id] || params[:product_id])
  end

  def customer_params
    params.require(:product).permit()
  end
  def is_admin?
    redirect_to root_path unless current_user.admin?
  end
  def product_params
    params.require(:product).permit(:name, :qty, :maker_id, :color, :code, :sub_product_type_id, :on_homepage, :price, :description)
  end
  def filter_params
    params.slice(:name, :type, :sub_type, :maker_id, :color, :code)
  end
end
