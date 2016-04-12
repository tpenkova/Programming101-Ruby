class Array
  def to_hash
	hash = {}
	each do |element|
		hash[element[0]] = element[1]
	end

	hash
  end

  def index_by
	hash = {}
	each do |element|
		hash[yield(element)] = element
	end

	hash
  end

  def subarray_count array
	count = 0 
	each_cons(array.length) {|n| count +=1 if n == array } 
	count
  end

  def occurences_count
	hash = {}
	each {|n| hash[n] = self.count(n) }
	hash
  end
end
