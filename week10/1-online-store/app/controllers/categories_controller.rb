class CategoriesController < ApplicationController
#@category е същото като category - локална променлива
  def count
    render json: Category.count
  end

  def index
    render json: Category.all
  end

  def show
    render json: Category.find(params[:id])
  end

  def range
    render json: Category.where("id > ?", params[:id])
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    if category.destroyed?
      render json: category
    else
      render json: { :errors => category.errors.full_messages }
    end
  end

  def from
    render json: Category.where("id >= ?", params[:id]).limit(params[:count])
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      render json: category
    else
      render json: category.errors, status: unprocessable_entity
    end
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: category, status: :created
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.permit(:name)
  end
end
