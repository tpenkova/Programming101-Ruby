def number_to_digits(n)
    n = n.to_s

    arr = Array.new
    i = 0

    while i < n.length
        arr[i] = n[i].to_i
        i += 1
    end

    arr
end

def digits_to_number(arr)
    arr.join.to_i
end

def grayscale_histogram(image)
  histogram = Array.new 256, 0

  row_index, col_index = 0, 0

  while row_index < image.length
    col_index = 0

    while col_index < image[row_index].length
      pixel_value = image[row_index][col_index]
      histogram[pixel_value] += 1
      col_index += 1
    end

    row_index += 1
  end

  histogram
end

def scalar_product(vector1, vector2)
  scalar_product = 0
  vector1.zip(vector2) {|v1, v2| scalar_product += v1*v2 }
  scalar_product
end

def max_scalar_product(vector1, vector2)
  vector1 = vector1.permutation.to_a
  vector2 = vector2.permutation.to_a
  scalar_products = []

  vector1.each do |v1|
    vector2.each do |v2|
      scalar_products << scalar_product(v1, v2)
    end
  end

  scalar_products.max
end

def max_span(numbers)
    mid = numbers.length/2
    left_count, right_count = 1, 1
    left_index, right_index = 0, numbers.length - 1
    i = 0

    left_part = numbers.slice(0, mid)
    right_part = numbers.slice(mid + numbers.length % 2, numbers.length)

    while i < left_part.length
        if left_part.count(left_part[i])
        end
    end
end

def sum_matrix(m)
  m.flatten.reduce(:+)
end

def coordinates(m)
  rows = m.size
  columns = m.first.size

  arr_rows = (0...rows).to_a
  arr_columns = (0...columns).to_a

  coordinates = arr_rows.each_with_object([]) do |e, coordinates|
    e = e.to_s
    temp = e * columns
    coordinates << temp.chars.map(&:to_i).zip(arr_columns)
  end

  coordinates.flatten(1)
end

def neighbour_coordinates(x, y, m)
  directions = [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1]
  ]

  directions.each_with_object([]) do |dir, coordinates|
    new_x = x + dir.first
    new_y = y + dir.last

    if new_x >= 0 && new_y >= 0 && new_x < m.size && new_y < m.first.size
      coordinates << [new_x,new_y]
    end
  end
end

def sum_matrix(m)
  m.flatten.reduce(:+)
end

def matrix_bombing_plan(m)
  arr_hashes = coordinates(m).map do |coordinate|
    tmp = m.map(&:dup)
    row, col = coordinate.first, coordinate.last #*coordinate
    neighbour_coordinates(row, col, tmp).each do |field|
      tmp[field.first][field.last] -= tmp[row][col]
      tmp[field.first][field.last] = 0 if tmp[field.first][field.last] < 0
    end
    {[row, col] => sum_matrix(tmp)}
  end

  arr_hashes.reduce(&:merge)
end

def group(items)
  arr = Array.new
  i, j, p = 0, 0, 0
  group = Array.new

  while j < items.length

    if items[j] == items[j+1]
      group[p] = items[j]
      p += 1
      j += 1
    else
      group[p] = items[j]
      arr[i] = group
      j +=1
      i += 1
      p = 0
      group = Array.new

    end
  end

  arr
end

def max_consecutive(items)
  i, count, max_count = 0, 1, 1

  while i < items.length
    if items[i] == items[i+1]
      count += 1
    else
      count = 1
    end

    if count > max_count
      max_count = count
    end

    if i == items.length - 1
      break
    end

    i += 1
  end

  max_count
end
