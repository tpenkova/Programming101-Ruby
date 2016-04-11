class NumberSet
  include Enumerable

  def initialize
    @numbers = []
  end

  def each(&block)
    @numbers.each &block
  end

  def <<(number)
    @numbers << number unless @numbers.include? number
  end

  def size
    @numbers.size
  end

  def empty?
    @numbers.empty?
  end

  def [](filter)
    @numbers.select do |n|
      filter.filter(n)
    end
  end
end

module FilterOperators
  def &(other)
    Filter.new {|n| filter(n) && other.filter(n)}
  end

  def |(other)
    Filter.new {|n| filter(n) || other.filter(n)}
  end
end

class Filter
  include FilterOperators

  def initialize(&block)
    @block = block
  end

  def filter(x)
    @block.(x)
  end
end

class TypeFilter
  include FilterOperators

  def initialize(type)
    @type = type
  end

  def filter(x)
    case @type
    when :integer
      x.kind_of?(Integer)
    when :real
      x.kind_of?(Float) || x.kind_of?(Rational)
    when :complex
      x.kind_of?(Complex)
    end
  end
end

class SignFilter
  include FilterOperators

  def initialize(sign)
    @sign = sign
  end

  def filter(x)
    case @sign
    when :positive
      x > 0
    when :non_positive
      x <= 0
    when :negative
     x < 0
    when :non_negative
      x >= 0
    end
  end
end

