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
