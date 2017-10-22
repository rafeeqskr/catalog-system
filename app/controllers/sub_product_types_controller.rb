class SubProductTypesController < ApplicationController
  before_action :set_sub_product_type, only: [:edit, :destroy, :update]
  before_action :is_admin?
  def index
    @sub_product_types = SubProductType.includes(:product_type).all
    @sub_product_type = SubProductType.new
    @product_type = ProductType.new
  end
  def create
    @sub_product_type = SubProductType.new(sub_product_type_params)

    respond_to do |format|
      @sub_product_type.save
      format.html { redirect_to sub_product_types_url, notice: 'Product was successfully created.' }
    end
  end
  def add_product_type
    @product_type = ProductType.new(type_name: params[:product_type][:type_name])

    respond_to do |format|
      @product_type.save
      format.html { redirect_to sub_product_types_url, notice: 'Product was successfully created.' }
    end
  end
  def edit
  end

  def update
    respond_to do |format|
      @sub_product_type.update(sub_product_type_params)
      format.html { redirect_to sub_product_types_url }
    end
  end

  def destroy
    @sub_product_type.destroy
    redirect_to sub_product_types_url
  end

  private

  def set_sub_product_type
    @sub_product_type = SubProductType.find(params[:id])
  end
  def sub_product_type_params
    params.require(:sub_product_type).permit(:type_name, :product_type_id)
  end
end
