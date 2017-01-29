(1..100).each do |number|
  # Loops through each number from 1 - 100

  if number % 3 == 0 && number % 5 == 0
    # Checks if number is divisible by both 3 & 5
    puts "FizzBuzz"

  elsif number % 3 == 0
    # Checks if number is divisible by only 3
    puts "Fizz"

  elsif number % 5 == 0
    # Checks if number is divisible by only 5
    puts "Buzz"

  else
    # Otherwise, prints the number itself
    puts number

  end

end
