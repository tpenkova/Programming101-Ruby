class Vector2D
  def initialize(x, y)
    @x, @y = x, y
  end

  def x
  	@x
  end

  def x=(value)
  	@x = value
  end

  def y
  	@y
  end

  def y=(value)
  	@y = value
  end

  def length
   	length = sqrt(@x**2 + @y**2)
  end

  def normalize
    @x /= length
    @y /= length
  end

  def ==(other)
   	if @x == other.x and @y == other.y
   		true
   	else
   		false
   	end
  end

  def +(other)
  	Vector2D.new @x + other.x, @y + other.y
  end

  def -(other)
    Vector2D.new @x - other.x, @y - other.y
  end

  def *(scalar)
    Vector2D.new @x * scalar, @y * scalar
  end

  def /(scalar)
    Vector2D.new @x / scalar, @y / scalar
  end

  def dot(other)
  	dot_product = @x*other.x + @y*other.y
    # Return the dot product of the two vectors
    # https://en.wikipedia.org/wiki/Dot_product#Algebraic_definition
  end

  def to_s
    "(#{@x}, #{@y})"
  end

end


#Vector
class Vector
  def initialize(*components)
  	@components = components.flatten

    # Let's make it more interesting here. I wanna initialize the vector with
    # `Vector.new(1, 2, 3, 4)` and `Vector.new([1, 2, 3, 4])` and expect the
    # same vector.
  end

  def dimension
  	d = @components.length
  	puts "#{d}D"
  end

  def length
  	sum = 0

  	@components.each do |x|
  		sum += x**2
  	end

  	Math.sqrt(sum)
  end

  def normalize
  	normalized_components = Array.new
  	@components.each { |x| normalized_components.push(x /= length) }
  	p normalized_components
  end

  def [](index)
    @components[index]
  end

  def []=(index, value)
    @components[index] = value
  end

  def ==(other)
  	index = 0
  	equal = true

  	if @components.length == other.length
  		while index < @components.length
  			if @components[index] == other[index]
  				index = index.next
  			else 
  				equal = false
  			end
  		end
  	else
  		equal = false
	end

  	if equal == true
  		true
  	else
  		false
  	end

  end

   def +(vector_of_same_dimension_or_scalar)
   	
   	
    # Return a new Vector that represents the result
    # Your code goes here.
  end

  def -(vector_of_same_dimension_or_scalar)
    # Return a new Vector that represents the result
    # Your code goes here.
  end

  def *(scalar)
    # Return a new Vector that represents the result
    # Your code goes here.
  end

  def /(scalar)
    # Return a new Vector that represents the result
    # Your code goes here.
  end

  def dot(vector_of_same_dimension_or_scalar)
    # Return the dot product of the two vectors
    # https://en.wikipedia.org/wiki/Dot_product#Algebraic_definition
  end

  def to_s
  	comp = Array.new
    @components.each do |x|
    	comp << "#{x}"
    end
    comp
  end

end