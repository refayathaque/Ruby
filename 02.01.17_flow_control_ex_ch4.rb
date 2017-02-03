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
