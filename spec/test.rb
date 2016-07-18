# Given two sorted arrays, find the elements in common.
# The arrays are the same length and each has all distinct elements.




# Pseudo code here
# iterate through elements in a
#   check every elemtn in b 
# then
# Your code here
def test(arr_a,arr_b)
  arr = []
  arr_a.each do |num|
    arr_b.each do |num_two|
      if num == num_two
        arr << num
      end 
    end
  end
  arr
end 

def my_benchmark(number_of_times) 
  start_time = Time.now
  number_of_times.times do 
    yield
  end
  puts Time.now - start_time
end

#find the min/max of A and B

def test_two(arr_a,arr_b)
  a_min = arr_a[0]
  a_max =arr_a[0]
  arr_a.each do |num|
    a_min = num if num < a_min 
    a_max = num if num > a_max
  end

  b_min = arr_b[0]
  b_max =arr_b[0]
  arr_b.each do |num|
    b_min = num if num < a_min 
    b_max = num if num > a_max
  end

  min = a_min > b_min ?  a_min : b_min
  max = a_max < b_max ?  a_max : b_max
end




A = [13, 27, 35, 40, 49, 55, 59]
B = [17, 35, 39, 40, 55, 58, 60]

 print test(A,B)
 my_benchmark(10000) {  test(A,B) }
 my_benchmark(10000) do
    c = B.each_with_object({}) do |n, hash|
      hash[n] = true
    end
    shared = A.select { |n| c.has_key?(n) }
  end
#=> [35, 40, 55]


#parser.rb

Parse = Struct.new('Parse')

  #parses string into hash/struct containing key attributes using Regex

  "<p class='foo bar' id='baz' name='fozzie'>"

  # <p
  # class='foo bar'
  # id='baz'
  # name='fozzie'>


#takes a html tag and organizes it into a hash
  def parse_tag(html)
    puts "-----------------------------------------------------------"
    str = html.match(/<(.*)>/).captures[0]
    elements= str.scan(/[a-z]{2,5}='[\w\s]*'/)

    puts "\nstring is::  #{str}"
    puts "element is:: #{elements} \n"

    hash = {}
    hash[:type] =str.sub(elements.join(' '), "").strip
  
    elements.each do |info|
      clazz = info.match(/([a-z]*)=/).captures[0].to_sym
      clazz_val = info.match(/'(.*)'/).captures[0]

      hash[clazz] = clazz_val
    end

    print "hash is:: #{hash} \n"
    puts "-----------------------------------------------------------"
  end

  h =parse_tag("<p class='foo bar' id='baz' name='fozzie' jon='stackdev'>")

  obj = Parse.new(h)