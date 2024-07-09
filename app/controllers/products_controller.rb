class ProductsController < ApplicationController
  def index
    # @products = Product.all
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find_by(id: params[:id])
    if @product.nil?
      flash[:alert] = "Product not found."
      redirect_to index_path
    end
  end
end
