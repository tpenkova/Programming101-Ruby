class Object
  def blank?
    return true unless self
    return delete(' ').empty? if instance_of? String
    return empty? if respond_to? :empty?

    false
  end

  def present?
    not blank?
  end

  def presence
    self if present?
  end

  def try(method_name = nil, &block)
    return nil if nil?
    return public_send(method_name) if method_name && respond_to?(method_name)

    instance_eval &block if block_given?
  end
end

class StringInquirer
  class InvalidInquiryError < StandardError; end

  def initialize(string)
    @string = "#{string}?"
  end

  def method_missing(method_name)
    method_name = method_name.to_s

    if method_name[-1] != '?'
      raise InvalidInquiryError.new "Inquiry must end with ?"
    end

    method_name == @string
  end
end

class String
  def inquiry
    StringInquirer.new self
  end
end
