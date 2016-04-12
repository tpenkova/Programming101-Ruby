class SearchesController < ApplicationController
  def search_by_type_and_slug
    result = Search.by_type_and_slug(search_params)
    render json: result
  end

  def search_by_type_and_property_and_slug
    result = Search.by_type_and_property_and_slug(search_params)
    render json: result
  end

  private

  def search_params
    params.permit(:type, :property, :slug)
  end
end
