# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr.inject(0) { |sum, elem| sum + elem }
end

def max_2_sum arr
  return 0 if arr.length == 0
  return arr[0] if arr.length == 1
  sum(arr.sort.reverse.first 2)
end

def sum_to_n? arr, n
  arr.each_with_index.any? do |x, i|
    arr.each_with_index.any? do |xx, ii|
      (xx + x == n) && (i != ii)
    end
  end
end

# Part 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant? s
  consonants = ('A'..'Z').reject { |c| ['A', 'E', 'I', 'O', 'U'].include? c }
  consonants.any? { |c| s.upcase.index(c).eql? 0 }
end

def parse_binary(s)
  return nil if s.empty?
  s.reverse.each_char.with_index.inject(0) do |sum, (c, index)|
    return nil unless ['0', '1'].include? c
    sum + c.to_i * (2 ** index)
  end
end 

def binary_multiple_of_4? s
  parsed_num = parse_binary(s)
  parsed_num.nil? ? false : parsed_num % 4 == 0
end

# Part 3

class BookInStock
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    raise ArgumentError if isbn.empty? || price <= 0
    @isbn, @price = isbn, price
  end

  def price_as_string
    "$#{sprintf("%0.02f", @price)}"
  end
end
