=begin
This document will cover some topics that are important to know, but not
necessary on our path to learn Ruby. We will just cover the basics of these
topics.
=end

=begin
REGEX (Regular Expression) - A sequence of characters that form pattern
matching rules, and is then applied to a string to look for matches.

Creating REGEX starts with / and ends with /, inside /../ we can place
any charaacters we want to match with the string. We use the =~ operator
to see if we have a match in our REGEX.

Let's say we're looking for the letter 'b' in the string 'powerball', we
want to see where in the string it is (we're looking for the index number).

[1] pry(main)> "powerball" =~ /b/
=> 5

We can also use the =~ operator as a boolean to check for matches, let's
try this in a method example below.
=end

def doesthestringhavea_s_or_t(string)
  if string =~ /s/
    string.capitalize!
    puts "'#{string}' has a 's', there is a match!"
  elsif string =~ /t/
      string.capitalize!
      puts "'#{string}' has a 't', there is a match!"
  else
    string.capitalize!
    puts "'#{string}' does NOT have a 's' or 't', no match here."
  end
end

doesthestringhavea_s_or_t("salmon") # Match
doesthestringhavea_s_or_t("halibut") # Match
doesthestringhavea_s_or_t("cod") # No match
doesthestringhavea_s_or_t("tilapia") # Match

=begin
In addition to the =~ operator we can also use the String#match method to
do REGEX comparisons. This method returns a `MatchData` object that
describes the match or `nil` if there is no match.

[1] pry(main)> /s/.match("mississippi")
=> #<MatchData "s">

We can also use String#match as a boolean, let's use it in our example
above.
=end

def doesthestringhavea_s_or_t(string)
  if /s/.match(string)
    string.capitalize!
    puts "'#{string}' has a 's', there is a match!"
  elsif /t/.match(string)
      string.capitalize!
      puts "'#{string}' has a 't', there is a match!"
  else
    string.capitalize!
    puts "'#{string}' does NOT have a 's' or 't', no match here."
  end
end

doesthestringhavea_s_or_t("salmon")
doesthestringhavea_s_or_t("halibut")
doesthestringhavea_s_or_t("cod")
doesthestringhavea_s_or_t("tilapia")

=begin
Whenever we encounter a string pattern matching problem, we must remember
to look into using REGEX.
=end

# RUBY STANDARD CLASSES

=begin
It's important to keep in mind that whenever we want to perform a specific
action we should explore Ruby's standard classes. IE Using libraries like
the `Math` module will help us to solve problems more efficiently. Let's
try out a few examples below.

[1] pry(main)> Math.sqrt(36)
=> 6.0

[3] pry(main)> Math::PI # The module also has constants like 'Pi'
=> 3.141592653589793

We can use the 'Time' class to figure out what day it was in the past.

[4] pry(main)> t = Time.new(2017, 2, 28)
=> 2017-02-28 00:00:00 -0500
[5] pry(main)> t.monday?
=> false
[6] pry(main)> t.tuesday?
=> true

=end

# VARIABLES AS POINTERS

=begin
Let's take a deeper look at variables, and how they act as POINTERs to a
place in memory.

a = "hi there"
b = a
a = "not here"

What is 'b'? That's right, 'b' is "hi there"

a = "hi there"
b = a
a << ", Bob"

What is 'b' in this new example? 'b' is actually "hi there, Bob"

We see that 'b' doesn't reflect the value of 'a' in the first example,
but does so in the second example. Why? To see why this happens we have
to understand that VARIABLES ARE POINTERS TO PHYSICAL SPACE IN MEMORY.
(Variables are essentially labels we create to refer to some physical
memory address in your computer.)

* Detailed notes are in blog 03.05.17 entry.

Let's see this in play with two methods.
=end

def test(b)
  b.map {|letter| "I like the letter: #{letter}"} # NOT mutating caller
end

a = ['a', 'b', 'c']
test(a)
puts a # Outputs 'a', 'b', and 'c'

puts "----"

def test(b)
  b.map! {|letter| "I like the letter: #{letter}"} # mutating caller
end

a = ['a', 'b', 'c']
test(a)
puts a # Outputs 'I like the letter: a', 'I like the letter: b', and
       # 'I like the letter: c'

=begin
When we pass an argument into a method, we're essentially assigning a
variable to another variable (like b = a in the previous example). Both
the variables are pointing to the same physical space in memory. If the
method is destructive then both the variables are pointing to the same
physical space in memory with a modified value. If the method is NOT
destructive then both variables point to the same unmodified physical
space in memory. Working with 'b' above in our 'test' method may or may
not modify the 'a' in the outer scope, it depends on whether or not we
modify the physical space in memory that 'a' is pointing to.
=end

# BLOCKS AND PROCS

=begin
Blocks, just like parameters, can be passed into a method. The ampersand
(&) in the method definition tells us that the argument is a block. The
block must always be the last parameter in the method definition. When
we're ready to use the method we call it like any other method, however,
since our method will accept blocks, we can pass in a block using do..end.
Let's see an example of this.
=end

def take_block(&block)
  block.call # Method#call
end

take_block do
  puts "Block being called in the method!"
end

puts "----"

# Let's try something harder, let's pass an argument AND a block.

def take_block(number, &block)
  block.call(number) # Method#call
end

number = 42
take_block(number) do |num|
  puts "Block being called in the method! #{num}"
end

puts "----"

=begin
Procs are blocks that are wrapped in a prob object and store in a variable
to be passed around. Let's try this out.
=end

talk = Proc.new do
  puts "I am talking."
end

talk.call # Proc#call

puts "----"

# Procs can also take arguments.

talk = Proc.new do |name|
  puts "I am talking to #{name}"
end

talk.call "Refayat"

puts "----"

# Procs can also be passed into methods.

def take_proc(proc)
  array = [2, 4, 6, 8, 10]
  array.each do |number|
    proc.call number
  end
end

proc = Proc.new do |number|
  power = number**number
  puts "#{number} to the power of #{number} is #{power}"
end

take_proc(proc)

=begin
2 to the power of 2 is 4
4 to the power of 4 is 256
6 to the power of 6 is 46656
8 to the power of 8 is 16777216
10 to the power of 10 is 10000000000

Procs give us the added flexibility to be able to reuse blocks in more
than one place without having to type them out every time.
=end

puts "----"

# EXCEPTION HANDLING

=begin
Exception handling allows us to deal with errors in a manageable and
predictable way. When our programs will be interacting with the real
world, there will be a large amount of unpredictibility. Users can
enter bad information, or a file-manipulating process can get corrupted.
What do we do in such instances? Our program must to know what to do when
running into these kinds of exceptional conditions. Ruby has an
`Exception` class that makes handling errors much easier, and also
syntactic structure with reserved words `begin`, `rescue`, and `end` to
signify exception handling. A common occurence of an error is when we
get a 'nil' value, and we can use the reserved words mentioned above to
prevent our program from crashing when it encounters a 'nil'. Let's
try out a couple of examples below.
=end

names = ['bob', 'joe', 'steve', nil, 'frank']

names.each do |name|
  begin
    puts "#{name}'s name hash #{name.length} letters in it."
  rescue # Code below is executed in case there's an exception, 'error'
         # in this case because of the 'nil' value in the array. In the
         # event of an exception code below is executed and program
         # continues running, instead of crashing.
    puts "SOMETHING WENT WRONG!"
  end
end

puts "----"

zero = 0
puts "Before each call"
zero.each { |element| puts element } rescue puts "CAN'T DO THAT!"
puts "After each call"

=begin
Output:

Before each call
Can't do that! # Because variable zero is NOT an array, it can't be
               # iterated on with Array#each. In lieu of an 'error' we
               # get the string "Can't do that!", because of 'rescue'
               # and the code following it which is printing the string
               # "Can't do that!".
After each call

We can see why the reserved word 'rescue' is relevant in both cases,
we are effectively rescuing our program from crashing. If we gave the
code above the correct variable (an Array), and the code above that a
string instead of "nil" in the Array, our 'rescue' blocks wouldn't get
executed and our outputs would be different.
=end

puts "----"

# Another example

def divide(number, divisor) # Notice how we have two parameters, this is
                            # new. We've always had one parameter, and
                            # most recently in this chapter, one parameter
                            # and a block under PROCs.
  begin
    answer = number / divisor
  rescue ZeroDivisionError => e
    e.message # Exception#message
  end
end

puts divide(16, 4)
puts divide(4, 0)
puts divide(14, 7)

puts "----"

=begin
In Ruby, when something goes wrong, we usually say "AN EXCEPTION IS
RAISED". This is a common technical phrase used to say that the code
encountered some sort of error condition.
=end

# EXCEPTIONS AND STACK TRACES

=begin

We must be able to parse through error conditions to find clues that will
help us in identifying the sources of problems.

Before progressing we need to understand how execution works within Ruby
involving the STACK. So what is the STACK? When Ruby invokes a method,
the method is added to Ruby's STACK. We can use the STACK TRACE (detailed
trace) to see the flow of execution and where errors occur. We'll do an
example below to show the STACK and STACK TRACE.
=end

def greet(person)
  puts "Hello, " + person
end

greet("John")
# greet(1)

=begin
Running the method above passing in both the arguments will output:

Hello, John
test.rb:2:in `+': no implicit conversion of Fixnum into String (TypeError)
	from test.rb:2:in `greet'
	from test.rb:6:in `<main>'

When we called greet("John") the STACK, or program execution, looked like
this:

main -> greet -> puts -> exit and return to main

When we called greet(1) the STACK looked like this:

main -> greet -> puts

So from the STACK above we can see that in the second method invocation,
greet(1), an error occurred and the program execution flow didn't exit
back to 'main', and stayed in the 'greet' method.

Now, we will look at the STACK TRACE to make sense of what exactly went
wrong. The STACK TRACE is below.

test.rb:2:in `+': no implicit conversion of Fixnum into String (TypeError)
	from test.rb:2:in `greet'
	from test.rb:6:in `<main>'

The STACK TRACE above tells us where the error occured and why: line 2
of the file and the error was because the types don't match. The error
occured due to the call made in the 'main' context on line 6, which
contains the line that called the method with incorrect arguments.

=end

# *** First time seeing a method intertwined with TWO other methods.

def space_out_letters(person)
  return person.chars.join(" ")
end

def greet(person)
  return "H e l l o, " + space_out_letters(person)
end

def decorate_greeting(person)
  puts greet(person)
end

decorate_greeting("John")
