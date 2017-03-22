# Example of USER INPUT REDACTION

puts "Enter some text please."
  text = gets.chomp.downcase
puts "What part of the text would you like to redact?"
  redact = gets.chomp

words = text.split # ['hello', 'how', 'are', 'you']

words.each do |element|
  if element != redact && element != words.last
    print element + " "
  elsif element == words.last && element == redact
    puts 'REDACTED'
  elsif element == words.last
    puts element
  else
    print 'REDACTED' + " "
  end
end

# Why so much code above? It's to make sure that we get a
# NEW LINE after every possible iteration.

puts "----"

# Example of a HISTOGRAM

puts "Please enter some text"
text = gets.chomp # "tomato tomato grape cherry apple apple apple"

words = text.split(" ") # Returns an array... ['tomato', 'tomato', 'grape',
                        # 'cherry', 'apple', 'apple', 'apple'] is 'words'.

frequencies = Hash.new(0) # 0 is the default value, and we need to have the default
                          # value here as 0, because of our code below. We need the
                          # value in the hash to start from 0 so we can increment
                          # every time an element appears more than once.

words.each do |element|
  frequencies[element] += 1 # Inserts element as key into key-value pairs, with
                            # value being 0 as default. Every time the same
                            # element is inserted the value is incremented.
end

# Outputs {"tomato"=>2, "grape"=>1, "cherry"=>1, "apple"=>3}

frequencies = frequencies.sort_by do |key, value|
  value
end

# Enumerable#sort_by (ascending order of VALUES) returns a nested array.
# 'frequencies' is now a nested array, because we are assigning this returned
# nested array to the variable 'frequencies'.

# Outputs [["grape", 1], ["cherry", 1], ["tomato", 2], ["apple", 3]]

frequencies.reverse!

# With HISTOGRAMs you want the highest frequency to be listed first. So we must
# use Array#reverse! This method will reverse the order of VALUES, and will
# mutate the caller.

# frequencies = [["apple", 3], ["tomato", 2], ["cherry", 1], ["grape", 1]]

frequencies.each do |key, value|
  puts key.capitalize + " " + value.to_s # OR "#{key.capitalize} #{value}"
end

# Outputs
# Apple 3
# Tomato 2
# Cherry 1
# Grape 1

puts "----"

# Example of a SPLAT ARGUMENTs in METHODs
# *** Used when # of arguments is UNKNOWN

def greetingtofriends(salutation, *friends) # Set up PARAMETERs for > 1 argument
  friends.each { |friend| puts "#{salutation} #{friend}!" }
  # Arguments after "Hi" when calling the method are ELEMENTS in an ARRAY.
end

greetingtofriends("Hi", "Jeremy", "Janet", "John", "Jamie")

# Outputs Hi Jeremy! Hi Janet! Hi John! Hi Jamie!

# Splat arguments are preceded by *, which signals to Ruby: "Hey Ruby, I don't
# know how many arguments there are about to be, but it could be more than one."

puts "----"

# But, if the # of arguments is KNOWN, we don't need SPLAT ARGUMENTs, we just
# have MORE THAN ONE PLACEHOLDER as the PARAMETERs. Let's do an example below.

def sumoftwonumbers(number1, number2)
  return number1 + number2
end

output = sumoftwonumbers(3, 7)
p output

puts "----"

# SPACESHIP OPERATOR (COMBINED COMPARISON OPERATOR) EXAMPLE

# This can come in handy when sorting data, e.g. Array#sort! will only sort in
# ASCENDING order, what if we want to sort in DESCENDING order WITHOUT having
# to use Array#reverse! in addition to Array#sort! ? Let's see this below.

carbrands = ["Honda", "Acura", "Toyota", "Lexus", "Buick", "Chevrolet"]

ascending = carbrands.sort!
p ascending
# Outputs ["Acura", "Buick", "Chevrolet", "Honda", "Lexus", "Toyota"]

descending = carbrands.sort! do |a, b|
  b <=> a
end
p descending
# Outputs ["Toyota", "Lexus", "Honda", "Chevrolet", "Buick", "Acura"]

# What if we want to sort it by the length of each string?

ascendinglength = carbrands.sort! do |a, b|
  a.length <=> b.length # Return value is 1
end
p ascendinglength
# Outputs ["Lexus", "Honda", "Buick", "Acura", "Toyota", "Chevrolet"]

puts "----"

# Often times we'll have to make our own METHODs to do things that are not in
# Ruby's built-in library, e.g. Ruby doesn't have a built-in way to sort data
# in REVERSE alphabetical order.

# EXAMPLE OF METHOD TO SORT IN REVERSE ALPHABETICAL ORDER

# Ruby, using Array#sort!, can sort alphabetically in ASCENDING order, but can't
# do the same in DESCENDING order. *** (Array#reverse! will only reverse the
# order WITHOUT SORTING).

def alphabetize(arr, rev=false) # Default value will be false for SECOND
                                # parameter if ONLY ONE argument is passed
  arr.sort!
    if rev!=false # Executes line below if TWO arguments are passed (passing TWO
                  # arguments will sort the array in DESCENDING order).
        arr.reverse!
    else # Executes line below if ONE argument is passed (passing ONE argument
         # will sort the array in ASCENDING order)
        arr.sort!
    end
end

words = ["Bob", "Arthur", "Jeremy", "Cassandra", "Alastair"]

resultASCENDING = alphabetize(words) # Same as Array#sort!
p resultASCENDING
#["Alastair", "Arthur", "Bob", "Cassandra", "Jeremy"]

p "ABOVE: Ascending, BELOW: Descending"

resultDESCENDING = alphabetize(words, words) # REVERSE ALPHABETICAL ORDER
p resultDESCENDING
# ["Jeremy", "Cassandra", "Bob", "Arthur", "Alastair"]

puts "----"

# What if we wanted to write the method above using SPACESHIP OPERATORs?

def alphabetize1(arr, rev=false)
    if rev!=false
        arr.sort! do |a, b|
          b <=> a # REVERSE ALPHABETICAL ORDER
        end
    else
        arr.sort! do |a, b|
          a <=> b
        end
    end
end

words = ["Bob", "Arthur", "Jeremy", "Cassandra", "Alastair"]

resultASCENDING = alphabetize1(words)
p resultASCENDING
#["Alastair", "Arthur", "Bob", "Cassandra", "Jeremy"]

p "ABOVE: Ascending, BELOW: Descending"

resultDESCENDING = alphabetize1(words, words) # REVERSE ALPHABETICAL ORDER
p resultDESCENDING
# ["Jeremy", "Cassandra", "Bob", "Arthur", "Alastair"]

puts "----"
