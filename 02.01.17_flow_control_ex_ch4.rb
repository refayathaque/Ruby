# Exercise 2

=begin
Write a method that takes a string as argument. The method should return
the all-caps version of the string, only if the string is longer than 10
characters. Example: change "hello world" to "HELLO WORLD". (Hint: Ruby's
String class has few methods that would be helpful. Check the Ruby Docs!)
=end

=begin
Before proceeding to write the code it'll be prudent to write some pseudo
-code. So let's start with the input, we know that to get a user input we
have to use 'gets.chomp'. So our first line of code should instruct the
user to enter whatever they want. Then that information must be stored for
later use, we can store information in a variable, so the variable must
have whatever the user input as a result of our 'gets.chomp' method. Then,
we must define the method starting with 'def', then we should give it a
name and the parameter. Following that we should set up our 'if/else'
conditional. We know that we can only perform the operation of making
all the letters capitalized IF what the user inputs is longer than 10
characters, so our 'if/else' conditional must take this into account.
Going through the Ruby Docs will help us find the methods we need to
1. find the character length of a string, 2. make a string into all-caps.
Finally, since we have a method, we must pass an argument into it, in our
case the argument will be the variable which saved the user's input.
=end

=begin
The 'gets' method ALWAYS RETURNS a string. That's why we don't need to do
'gets.chomp.to_s'. Look below:
[1] pry(main)> a = gets.chomp
Hi Andrew!
=> "Hi Andrew!"
[2] pry(main)> a.class
=> String
[3] pry(main)> b = gets.chomp
12345
=> "12345"
[4] pry(main)> b.class
=> String
[5] pry(main)> c = gets.chomp
1.2345
=> "1.2345"
[6] pry(main)> c.class
=> String
[7] pry(main)>
=end

puts "Enter a word or phrase"
wordorphrase = gets.chomp # Variable will store the user input

def allcaps(string) # Defining our method with a name and parameter
  if string.length > 10 # 'if' condition
    puts string.upcase # If above is true then this gets executed
  else
    puts string # If above 'if' condition is false this gets executed
  end
end

allcaps(wordorphrase) # We're passing the argument into our method above

puts "----"

# A refactored way of doing the example above

puts "Enter a word or phrase"
wordorphrase = gets.chomp

def allcaps(string)
  if string.length > 10
    string.upcase
  else
    string
  end
end

puts allcaps(wordorphrase) # Instead of having 'puts' in the 'allcaps'
# method, we just called the method 'allcaps' and passed the argument
# 'wordorphrase' with a 'puts' in front.

puts "----"

# Exercise 3

=begin
Write a program that takes a number from the user between 0 and 100 and
reports back whether the number is between 0 and 50, 51 and 100, or above
100.
=end

=begin
Let's write some pseudo-code before starting. So our code will need to
begin with a user input, and since we will be collecting an integer we
must take that into account when writing the user input part of the
code. Then we come to the main part of our code, and here we know for
certain that it will be an 'if/else' conditional with 'elsifs' in there
as well because we are looking for three distinct cases in which we will
need to output a message. Keep in mind, we can use a 'method' to craft
our code, or not, we can have it be simple, it's upto us. :)
=end

puts "Please enter a number between 0 and 100"
number = gets.chomp.to_i # .to_i converts a string to an integer

if number >= 0 && number <= 50
  puts "Your number is between 0 and 50"
elsif number >= 51 && number <= 100
  puts "Your number is between 51 and 100"
elsif number > 100
  puts "Your number is greater than 100"
else
  puts "Your number is negative"
end

puts "----"

# We will refactor the code we just wrote above as a 'method'

puts "Please enter a number between 0 and 100"
number = gets.chomp.to_i

def numbercheck(integer)
  if integer >= 0 && integer <= 50
    puts "Your number is between 0 and 50"
  elsif integer >= 51 && integer <= 100
    puts "Your number is between 51 and 100"
  elsif integer > 100
    puts "Your number is greater than 100"
  else
    puts "Your number is negative"
  end
end

numbercheck(number)

puts "----"

=begin
So we established ranges using the inequality and the '&&' operators
above, but we didn't have to do that. There's a simpler way with ONLY
the inequality operators, and we can see that below.
=end

puts "Please enter a number between 0 and 100"
number = gets.chomp.to_i

if number < 0
  puts "#{number} is negative" # String interpolation...
elsif number <= 50
  puts "#{number} is between 0 and 50"
elsif number <= 100
  puts "#{number} is between 51 and 100"
else
  puts "#{number} is greater than 100"
end

puts "----"

# Exercise 5

=begin
Rewrite your program from exercise 3 using a case statement, and wrap
this new case statement in a method.
=end

# Exercise 3 as a Case Statement

puts "Please enter a number between 0 and 100"
number = gets.chomp.to_i

answer = case
when number < 0
  "#{number} is negative"
when number <= 50
  "#{number} is between 0 and 50"
when number <= 100
  "#{number} is between 51 and 100"
else
  "#{number} is greater than 100"
end

puts answer

puts "----"

# Can also be refactored using our other version with the '&&' operators

puts "Please enter a number between 0 and 100"
number = gets.chomp.to_i

answer = case
when number >= 0 && number <= 50
  "Your number is between 0 and 50"
when number >= 51 && number <= 100
  "Your number is between 51 and 100"
when number > 100
  "Your number is greater than 100"
else
  "Your number is negative"
end

puts answer

puts "----"

# Case Statements wrapped in a 'method'

puts "Please enter a number between 0 and 100"
integer = gets.chomp.to_i # We had to change the variable name since
# we are wrapping the case statement in a 'method'. Using 'number'
# wouldn't work as we would be passing that in as the parameter, which
# would've ALSO be 'number'. So we changed the variable to 'integer'.

def casestatement(number)
answer = case
  when number < 0
    "#{number} is negative"
  when number <= 50
    "#{number} is between 0 and 50"
  when number <= 100
    "#{number} is between 51 and 100"
  else
    "#{number} is greater than 100"
  end
puts answer # Note how we just moved this INTO the method.
end

casestatement(integer)

puts "----"

# Below is the Case Statement based off the version with the '&&'
# operators wrapped in a 'method'.

puts "Please enter a number between 0 and 100"
integer = gets.chomp.to_i

def casestatement(number)
case
  when number >= 0 && number <= 50
    "Your number is between 0 and 50"
  when number >= 51 && number <= 100
    "Your number is between 51 and 100"
  when number > 100
    "Your number is greater than 100"
  else
    "Your number is negative"
  end
end

# In this example we removed 'puts answer' from the method (which
# also meant deleting the variable 'answer' assigned to 'case'),
# and we are placing 'puts' (below) when we pass an argument to the
# method.

puts casestatement(integer)

puts "----"

=begin
There is actually ANOTHER way to do a Case Statement, and that's
using things we haven't yet tried. 1) We can set up ranges using
'..'. For example, instead of 'number >= 0 && number <= 50', we can
do '0..50'. 2) We know Case Statements are made up of 'when and
else', but we didn't know that we can have a sub-section within an
'else', IE we can have an 'if/else' WITHIN an 'else' in a Case
Statement. We will demonstrate both these new things below.
=end

# 02.05.17 - Code below DOESN'T work...

puts "Please enter a number between 0 and 100"
integer = gets.chomp.to_i

def casestatement(number)
case
when number == 0..50
    "Your number is between 0 and 50"
  when number == 51..100
    "Your number is between 51 and 100"
  else
    if number < 0
      "Your number is negative"
    else
      "Your number is greater than 100"
    end
  end
end

puts casestatement(integer)
