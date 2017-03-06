# 1. Write a program that checks if the sequence of characters "lab" exists
# in the following strings. If it does exist, print out the word.
# "laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"

lab = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

lab.each do |element|
  if element =~ /lab/
    puts "#{element} has 'lab' in it"
  elsif element =~ /Lab/
    puts "#{element} has 'lab' in it"
  else
    puts "#{element} does NOT have 'lab' in it"
  end
end

puts "----"

lab.each do |element|
  if /lab/.match(element)
    puts "#{element} has 'lab' in it"
  elsif /Lab/.match(element)
    puts "#{element} has 'lab' in it"
  else
    puts "#{element} does NOT have 'lab' in it"
  end
end

puts "----"

lab.each do |element|
  a = element.downcase
  if /lab/.match(a)
    puts "#{element} has 'lab' in it"
  else
    puts "#{element} does NOT have 'lab' in it"
  end
end

puts "----"

# We can also do a method, passing in the strings as arguments.

def checklab(string)
  b = string.downcase
  if /lab/.match(b)
    puts "#{string} has 'lab' in it"
  else
    puts "#{string} does NOT have 'lab' in it"
  end
end

checklab("laboratory")
checklab("experiment")
checklab("Pans Labyrinth")
checklab("elaborate")
checklab("polar bear")

puts "----"

# 2. What will the following program print to the screen? What will it return?

def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

# Nothing printed because nothing is called on the variable 'block'.
# Returns Proc object #<Proc:0x007f97b284da90@(pry):10>.

# We can fix ^ by calling the method Proc#call on the variable 'block'.

def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# Prints "Hello from inside the execute method!"
# Returns 'nil' because IO#puts always returns 'nil'.

# *** Remember the AMPERSAND sign (&) before 'block' in the parameter! The
# method parameter 'block' with '&' before it (&block) is what allows a
# block to be passed as a parameter.
