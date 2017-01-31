# METHOD CHAPTER EXERCISES

# 1. Write a program that prints a greeting message. This program should
# contain a method called 'greeting' that takes a 'name' as its parameter
# and returns a string.

def greeting(name)
  puts "Hello " + name + "!"
end

greeting("Refayat")

puts "----"

# 3. Write a program that includes a method called 'multiply' that takes
# two arguments and returns the product of the two numbers.

def multiply(a, b)
  p a * b
end

multiply(7, 9)

puts "----"

# 4. What will the following code print to the screen?

def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")

=begin
This won't print anything. Why? It won't print anything because the
'return' reserved word prevents the code from evaluating the last line
in the method, which is 'puts words'. If there was no 'return' then the
last line in the method, 'puts words', would have been evaluated and the
method would have output "Yippeee!!!!" to the terminal. (Without 'return'
the method would have also returned 'nil' in PRY because of 'puts words')
If we ran this code in PRY we would just get a return value of 'nil'
because the line in the method with 'return' has nothing following
'return', since there is nothing to return we only get a 'nil'.
=end

# 5. A) Edit the method in exercise 4 so that it does print words on
# the screen. B) What does it return now?

def scream(words)
  words = words + "!!!!"
  puts words
end

scream("Yippeee") # Prints "Yippeee!!!!", and returns 'nil'

=begin
We were asked to make an edit above, and we did (and got) exactly what
we discussed between lines 39 to 42. Removing 'return' allowed the method
to evaluate the last line, which was 'puts words'. Evaluating 'puts words'
allowed us to output "Yippeee!!!!", and return 'nil' (this can be seen
in PRY).
=end
