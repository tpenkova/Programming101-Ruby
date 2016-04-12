class BrandsController < ApplicationController
  def count
    render json: Brand.count
  end

  def index
    render json: Brand.all
  end

  def show
    render json: Brand.find(params[:id])
  end

  def range
    render json: Brand.where("id > ?", params[:id])
    #get /brands/range/1; drop table brands;
    #params[:id] = "1; drop table brands;
    #
    # select * from brands where id > 7
  end

  def destroy
    # @brand
    brand = Brand.find(params[:id])
    brand.destroy

    if brand.destroyed?
      render json: brand
    else
      render json: { :errors => brand.errors.full_messages }
    end
  end

  def from
    render json: Brand.where("id >= ?", params[:id]).limit(params[:count])
  end

  def update
    brand = Brand.find(params[:id])
    if brand.update(brand_params)
      render json: brand
    else
      render json: brand.errors, status: unprocessable_entity
    end
  end

  def create
    #<<-JSON
    #{
    #  "name": "So fancy",
    #  "quality": "Great"
    #}
    #JSON

    #params[:name]
    #params[:quality]

    #Винаги има controller, action, format
    #params[:controller] #brands
    #params[:action] #create
    #params[:format] #

    #params[:brand] = {name: "So fancy", quality: "Great"}
    #params[:brand][:name] == params[:name]
    #params[:brand][:quality] == params[:quality]
    #params[:brand][:controller] == nil #!!!

    brand = Brand.new(brand_params)
    if brand.save
      render json: brand, status: :created
    else
      render json: brand.errors, status: :unprocessable_entity
    end
  end

  private

  def brand_params
    params.permit(:name, :description)
  end
end
