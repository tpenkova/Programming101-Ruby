# Implementation of our own Enumerable class
module MyEnumerable
  def map
    Array.new.tap do |arr|
      each do |element|
        arr << (yield element)
      end
    end
  end


  def filter
    Array.new.tap do |arr|
      each do |element|
        if yield element
          arr << element
        end
      end
    end
  end

  def first
    element = nil

    each do |x|
      element = x
      break
    end

    element
  end

  def reduce(initial = nil)
    skip_first = false

    if initial.nil?
      initial = first
      skip_first = true
    end

    each do |x|
      if skip_first
        skip_first = false
        next
      end
      initial = yield initial, x
    end

    initial
  end

  def reject
    Array.new.tap do |arr|
      each do |element|
        unless yield element
          arr << element
        end
      end
    end
  end

  def include?(element)
    each do |e|
      if e == element
        return true
      end
    end
    false
  end

  def count(element = nil)
    if element.nil?
      return size
    end

    filter {|x| x == element }.size
  end

  def size2
    count = 0

    each do |e|
      count += 1
    end

    count
  end

  def size
    map {|x| 1}.reduce(0) {|acc,x| acc+x}
  end

  def any2?
    each { |element| return true if yield(element) }
    false
  end

  def any?(&block)
    filter(&block).size > 0
  end

  def all?(&block)
    filter(&block).size == size
  end

  def min
    min_element = first 

    each do |e|
      min_element = e if min_element > e
    end

    min_element

  end

  def min_by
    minEl = first
    minValue = yield first

    each do |e|
      if minValue > yield(e)
        minEl = e
        minValue = yield e
      end
    end

    minEl
  end

  def max
    maxElement = first 

    each do |e|
      maxElement = e if maxElement < e
    end

    maxElement
  end

  def max_by
    minEl = first
    minValue = yield first

    each do |e|
      if minValue <  yield(e)
        minEl = e
        minValue = yield e
      end
    end

    minEl
  end

  def take(n)
    Array.new.tap do |arr|
      count = 0
      each do |element|
        count.next
        arr << element
        break if count == n
      end
    end
  end

  def take_while
    Array.new.tap do |arr|
      each do |element|
        arr << element if yield element
      end
    end
  end

  def drop(n)
    Array.new.tap do |arr|
      count = 0
      each do |element|
        count.next
        arr << element
        break unless count == n
      end
    end
    # Your code goes here.
  end

  def drop_while
    Array.new.tap do |arr|
      each do |element|
        arr << element unless yield element
      end
    end
  end
end

