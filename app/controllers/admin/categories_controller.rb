class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  # def create
  #   @product = Product.new(product_params)

  #   if @product.save
  #     redirect_to [:admin, :products], notice: 'Product created!'
  #   else
  #     render :new
  #   end
  # end


end