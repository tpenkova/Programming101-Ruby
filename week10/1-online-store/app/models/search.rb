class Search
  def self.by_type_and_slug(params)
    case params[:type]
    when 'categories'
      Category.where('name Like ?', "%#{params[:slug]}%")
    when 'products'
      Product.where('name Like ?', "%#{params[:slug]}%")
    when 'brands'
      Brand.where('name Like ?', "%#{params[:slug]}%")
    end
  end

  def self.by_type_and_property_and_slug(params)
    case params[:type]
    when 'categories'
      Category.where("#{params[:property]} Like ?", "%#{params[:slug]}%")
    when 'products'
      Product.where("#{params[:property]} Like ?", "%#{params[:slug]}%")
    when 'brands'
      Brand.where("#{params[:property]} Like ?", "%#{params[:slug]}%")
    end
  end
end





