# 1. Below is an array and a number. Write a program that checks to see if the
# number appears in the array.

arr = [1, 3, 5, 7, 9, 11]
number = 3

if arr.include?(number) # Executes line below if boolean is 'true'
  puts "arr has the number 3"
end

puts "----"

# A more complicated version...

boolean = arr.include?(number) # Assigning boolean value to a variable
  if boolean == true
    puts "arr has the number 3"
  else # Executes line below if variable 'boolean' != true
end

puts "----"

arr.each do |element| # Iterates over 'arr'
  if element == number # Executes line below if any element == 3
    puts "arr has the number 3"
  end
end

puts "----"

# A method with Array#each_with_index and an 'else' statement...

def checkforelement(element)
arr = [1, 3, 5, 7, 9, 11] # Must be initialized in INNER SCOPE because
                          # this is a method. Methods have their own SCOPE.
  arr.each_with_index do |element, index|
    if element == 3
      puts "Index #{index + 1} has the number 3" # Since index starts at 0
    else
      puts "Index #{index + 1} doesn't have the number 3, it's #{element}"
    end # Closing 'if/else' statement
  end # Closing Array#each_with_index 'do..end' block
end # Closing method 'checkforelement'

checkforelement(3)

puts "----"

# How do you print the word 'example' from the following array?

array = [["test", "hello", "world"], ["example", "mem"]]

p array[1].first

puts "----"

# Or...

p array.last.first
