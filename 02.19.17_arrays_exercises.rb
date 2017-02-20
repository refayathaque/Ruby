# Below is an array and a number. Write a program that checks to see if the
# number appears in the array.

arr = [1, 3, 5, 7, 9, 11]
number = 3

if arr.include?(number)
  puts "arr has the number 3"
end

puts "----"

# A more complicated version...

boolean = arr.include?(number)
  if boolean == true
    puts "arr has the number 3"
  else
    puts "arr doesn't have the number 3"
end

puts "----"

arr.each do |element|
  if element == number
    puts "arr has the number 3"
  end
end

puts "----"

# A method with Array#each_with_index and an 'else' statement...

def checkforelement(element)
arr = [1, 3, 5, 7, 9, 11]
  arr.each_with_index do |element, index|
    if element == 3
      puts "Index #{index} has the number 3"
    else
      puts "Index #{index} doesn't have the number 3, it's #{element}"
    end
  end
end

checkforelement(3)
