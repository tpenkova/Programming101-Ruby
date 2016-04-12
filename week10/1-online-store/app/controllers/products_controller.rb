class ProductsController < ApplicationController
  def count
    render json: Product.count
  end

  def index
    render json: Product.all
  end

  def show
    render json: Product.find(params[:id])
  end

  def range
    render json: Product.where("id > ?", params[:id])
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy

    if product.destroyed?
      render json: product
    else
      render json: { :errors => product.errors.full_messages }
    end
  end

  def from
    render json: Product.where("id >= ?", params[:id]).limit(params[:count])
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product
    else
      render json: product.errors, status: unprocessable_entity
    end
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: :created
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  private
  def product_params
    params.permit(:name, :brand_id, :category_id, :price, :quantity)
  end
end
