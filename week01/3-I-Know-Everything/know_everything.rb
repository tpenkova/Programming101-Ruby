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

def numbers_to_message(sequence)
  upcase = false

  grouped = group(sequence).each do |array|
    array.map! { |item| item.to_i }
  end

  keypad = {
    2 => %w[a b c],
    3 => %w[d e f],
    4 => %w[g h i],
    5 => %w{j k l},
    6 => %w[m n o],
    7 => %w[p q r s],
    8 => %w[t u v],
    9 => %w[w x y z]
  }
  result = ""
  grouped.each do |array|
    if array.first == 1
      upcase = true
      next
    end
    if array.first == -1
      upcase = false
      next
    end
    if array.first == 0
      result << " "
      next
    end
    pressed_key = keypad[array.first]
    letter = pressed_key[(array.length - 1) % pressed_key.length]
    if upcase
      result << letter.upcase
      upcase = false
    else
      result << letter
    end
  end
  result
end

def add_spam(string)
  string << " " if string.length > 0
  string << "spam"
end

def prepare_meal(number)
  result = ""

  if number % 3 == 0 && number % 5 != 0
    count = (Math.log(number, 3))
    while count > 0
      add_spam(result)
      count -= 1
    end
  end

  if number % 3 == 0 && number % 5 == 0
    count = Math.log(number/5, 3)
    while count > 0
      add_spam(result)
      count -= 1
    end
  end

  if number == 5
    result << "eggs"
  end

  if number > 5 && number % 5 == 0
    result << " " if result.length > 0
    result << "and eggs"
  end

  result
end

def reduce_file_path(path)
  new_path = "/"

  path = path.split('/')
  path.each_with_index do |el, index|
    case el
    when ".."
      path.delete_at(index-1)
    end
  end

  path.delete("..")
  path.delete(".")

  if path.count > 1
    path.each do |el|
      new_path << el
      if el != ""
        new_path << "/"
      end
    end
    new_path.chop!
  end

  new_path
end

def magic_square?(array)
  array_sums = []

  sum_rows(array, array_sums)
  sum_columns(array, array_sums)
  sum_diagonal(array, array_sums)
  sum_second_diagonal(array, array_sums)

  array_sums.each_with_index do |sum, index|
    return false if array_sums[index] != array_sums[index-1]
  end

  true
end

def sum_diagonal(array, array_sums)
  sum = 0
  row, col = 0, 0
  while(row < array.count)
    sum += array[row][col]
    row += 1
    col += 1
  end
  array_sums << sum
end

def sum_second_diagonal(array, array_sums)
  sum = 0
  row, col = array.count - 1, array.count - 1
  while(row >= 0)
    sum += array[row][col]
    row -= 1
    col -= 1
  end
  array_sums << sum
end

def sum_columns(array, array_sums)
  col = 0
  while(col < array.first.count)
    row, sum = 0, 0
    while row < array.count
      sum += array[row][col]
      row += 1
    end
    array_sums << sum
    col += 1
  end
end

def sum_rows(array, array_sums)
  array.each do |el|
    array_sums << el.reduce(:+)
  end
end

def an_bn?(word)
  if(word.length > 0 && word.length % 2 == 0)
    left_side = word.slice(0, word.length/2)
    right_side = word.slice(word.length/2, word.length-1)
    left_side.chars.uniq.join == "a" && right_side.chars.uniq.join == "b"
  elsif (word.length == 0)
    true
  else
    false
  end
end

def valid_credit_card?(number)
  number = number.to_s.chars.map(&:to_i)
  new_number = []

  number.each_with_index do |digit, index|
    if index % 2 != 0
      digit *= 2
    end
    new_number << digit
  end
  sum = new_number.join.chars.map(&:to_i).reduce(:+)
  sum % 10 == 0
end

require 'prime'

def goldbach(n)
  raise "IncorrectNumber" if(n < 3)
  primes = Prime.take_while {|p| p < n }

  pairs = []
  primes.combination(2) do |a, b|
     pairs << [a,b] if a + b == n
     pairs << [a,a] if a + a == n
  end

  pairs
end

def message_to_numbers(message)
  keypad = {
    2 => %w[a b c],
    3 => %w[d e f],
    4 => %w[g h i],
    5 => %w{j k l},
    6 => %w[m n o],
    7 => %w[p q r s],
    8 => %w[t u v],
    9 => %w[w x y z]
  }

  result = []
  message = message.chars

  message.each do |letter|

    if letter == " "
      result << 0
      next
    end

    if letter == letter.upcase
      letter = letter.downcase
      result << 1
    end

    keypad.each do |key, values|
      if values.include?(letter)
        values.each_with_index do |l, i|
          if letter == l
            result << -1 if result.last == key
            while i+1 > 0
              result << key
              i -= 1
            end
          end
        end
      end
    end
  end

  result
end

def magic_square2(matrix)
  rows = matrix.map { |r| r.reduce(:+) }
  cols = matrix.transpose.map { |c| c.reduce(:+) }
  diag = matrix.each_with_index.map{ |row, i| row[i] }.reduce(:+)
  second_diag = matrix.each_with_index.map{ |row, i| row[row.count - i -1] }.reduce(:+)

  [rows, cols, diag, second_diag].flatten.uniq.length == 1
end

