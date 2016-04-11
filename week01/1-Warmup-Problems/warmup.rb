def fact(n)
    result = 1
    while n > 0 do
        result *= n
        n -= 1
    end
    result
end

def factR(n)
    if n == 0
        1
    else
        n * fact(n-1)
    end
end

def nth_lucas(n)
    arr = Array.new (n)
    i = 2

    arr[0] = 2
    arr[1] = 1

    while i < n do
        arr[i] = arr[i-1] + arr[i-2]
        i += 1
    end

    arr[n-1]
end

def first_lucas(n)
    arr = Array.new (n)
    result = Array.new
    i, j = 2, 0

    arr[0] = 2
    arr[1] = 1

    while i < n do
        arr[i] = arr[i-1] + arr[i-2]
        i += 1
    end

    while j < n
      result << arr[j]
      j += 1
    end

    result
end

def count_digits(n)
    count = 0

    while n > 9 do
        n /= 10
        count +=1
    end

    count += 1
    count
end

def sum_digits(n)
    sum = 0

    while n > 9 do
        sum += n%10
        n /= 10
    end

    sum += n
    sum
end

def factorial_digits(n)
    sum = 0

    while n > 9 do
        sum += fact(n%10)
        n /= 10
    end

    sum += fact(n)
    sum
end

def fib_number(n)
    arr = Array.new (n)
    i = 2

    arr[0] = 1
    arr[1] = 1

    while i < n do
        arr[i] = arr[i-1] + arr[i-2]
        i += 1
    end

    if n == 1
      arr[0].to_i
    else
      arr.join.to_i
    end
end

def hack?(n)
    n = n.to_s(2)
    n == n.reverse and n.count('1').odd?
end

def next_hack(n)
    n = n.next
    until hack? n do
        n = n.next
    end
    n
end

def count_vowels(str)
  vowels = "aeiouy"
  str = str.downcase
  i = 0
  count = 0

  while i < str.length do
    if(vowels.include? str[i])
      count += 1
    end
    i += 1
  end

  count
end

def count_consonants(str)
  consonants = "bcdfghjklmnpqrstvwxz"
  str = str.downcase
  i = 0
  count = 0

  while i < str.length do
    if(consonants.include? str[i])
      count += 1
    end
    i += 1
  end

  count
end

def p_score(n)
  n = n.to_s

  if (n == n.reverse)
    p = 1
  else
    s = n.to_i + n.reverse.to_i
    p = 1 + p_score(s)
  end

  p
end

def palindrome?(n)
  n = n.to_s
  n == n.reverse
end

def prime?(n)
  num = n.to_i.abs

  return false if num == 0 || num == 1
  2.upto(num - 1) do |i|
    return false if num % i == 0
  end

  true
end

def first_primes(n)
  i = 1

  while i <= n do
    if(prime?(i) == true)
      p i
    end
    i += 1
  end
end

def sum_of_numbers_in_string(string)
  sum = 0

  while string.length > 0 do
    number = string.to_i
    sum += number
    string = string.slice(number.to_s.length, string.length)
  end

  sum
end

def anagrams?(a, b)
  a.chars.sort == b.chars.sort
end

def balanced?(n)
  n = n.to_s
  mid = n.length/2

  left_part = n.slice(0, mid)
  right_part = n.slice(mid + n.length % 2, n.length)

  sum_digits(left_part.to_i) == sum_digits(right_part.to_i)
end

def zero_insert(n)
  result = ''
  index, n = 0, n.to_s

  while index < n.length - 1
    a, b = n[index].to_i, n[index + 1].to_i

    result += a.to_s
    result += '0' if a == b || (a + b) % 10 == 0

    index += 1
  end

  result += n[index]
  result.to_i
end
