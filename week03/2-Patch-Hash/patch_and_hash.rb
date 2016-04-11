class Hash
  def pick(*keys)
    Hash.new.tap do |h|
      each do |k,v|
        h[k] = v if keys.include? k
      end
    end
  end

  def except2(*keys)
    reject {|k, v| keys.include? k}
  end

  def except(*keys)
    pick_hash = {}
    keys = keys.flatten

    keys.each do |pick_key|
      each do |key, value|
        pick_hash[key] = value unless keys.include?(key)
      end
    end
    pick_hash
  end

  def compact_values
    pick_hash = {}

    each do |key, value|
      unless value == nil or value == false
        pick_hash[key] = value
      end
    end
    pick_hash
  end

  def defaults(hash)
    defaults = {}
    hash.each do |h_key, h_value|
      each do |key, value|
        if !self.include?(h_key)
          defaults[h_key] = h_value
        else
          defaults[key] = value
        end
      end
    end

    defaults
  end
end
