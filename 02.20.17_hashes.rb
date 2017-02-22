# HASHES

=begin
A HASH is a data structure which stores items by associated KEYs. Arrays,
on the other, store items by an ordered index. Entries in a HASH are
referred to as 'key-value pairs'. HASHES are created using symbols (:)
as keys and any data types as values. Key-value pairs in a hash are
surrounded by curly braces '{}', and are separated with commas. HASHES
can be created using two syntaxes, the old and the new. The old syntax
uses '=>' to separate the key and the value. The new syntax was brought
with Ruby version 1.9 does not use '=>' to separate the key and the value.

[1] pry(main)> oldsyntax = {:name=>'Refayat'}
=> {:name=>"Refayat"}

[2] pry(main)> newsyntax = {name:'Refayat'}
=> {:name=>"Refayat"}

We can have HASHES with multiple key-value pairs

[1] pry(main)> newsyntax = {name:'Refayat', age:'27'}
=> {:name=>"Refayat", :age=>"27"}

Say we want to add another key-value pair, how do we do that?

[3] pry(main)> newsyntax[:hair] = 'black'
=> "black"
[4] pry(main)> newsyntax
=> {:name=>"Refayat", :age=>"27", :hair=>"black"}

What if we wanted to remove a key-value pair?

[5] pry(main)> newsyntax.delete(:age)
=> "27"
[6] pry(main)> newsyntax
=> {:name=>"Refayat", :hair=>"black"}

Say we wanted to retrieve a piece of information from a hash

[7] pry(main)> newsyntax[:hair]
=> "black"

What if we wanted to retrieve the corresponding key of a specific value?

# We use the Hash#key method.

[11] pry(main)> newsyntax.key("Refayat")
=> :name

Say we wanted to merge two hashes together. How would we do that?

# We use the Hash#merge! method if we want to mutate the caller. And
# Hash#merge method if we dont want to mutate the caller, IE leave the
# original hash unmodified.

[12] pry(main)> newsyntax
=> {:name=>"Refayat", :hair=>"black"}
[13] pry(main)> newhash = {city: 'Washington DC', car: 'BMW'}
=> {:city=>"Washington DC", :car=>"BMW"}
[15] pry(main)> newsyntax.merge!(newhash)
=> {:name=>"Refayat",
 :hair=>"black",
 :city=>"Washington DC",
 :car=>"BMW"}
[16] pry(main)> newsyntax
=> {:name=>"Refayat",
 :hair=>"black",
 :city=>"Washington DC",
 :car=>"BMW"}
[17] pry(main)> newhash
=> {:city=>"Washington DC", :car=>"BMW"}

We called Hash#merge! on Hash ‘newsyntax’ and passed in Hash ‘newhash’ as an
argument.

=end

# ITERATING OVER HASHES

=begin
Iterating over HASHES is similar to iterating over arrays, there are some
small differences. One difference has to do with the variables, with HASHES
we have to assign variables to both the key and the value. Let's do an example
below and see how this works.
=end

person = {name: 'Bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}

person.each do |key, value| # Assigned two variables to the key and value
  puts "Bob's #{key} is #{value}" # Using String Interpolation we get the
  # output 'Bob's name is Bob, Bob's height is 6 ft, Bob's weight is 160 lbs,
  # Bob's hair is brown'.
end

puts "----"

# HASHES AS OPTIONAL PARAMETERS

=begin
Previously, in the methods chapter, we talked about how we can assign default
PARAMETERS to methods so that our outputs remain consistent. We can also use
HASHES to accept OPTIONAL PARAMETERS when creating methods. This allows us
to give our methods more flexibility and expressivity. Let's try this out.
=end

def greeting(name, options = {})
  if options.empty?
    puts "Hi my name is #{name}"
  else
    puts "Hi my name is #{name}. I'm #{options[:age]} years old and my hair" +
    " color is #{options[:hair]}."
  end
end

ageandhair = {age: 28, hair: "black"}
greeting("George")
greeting("George", ageandhair) # The entire HASH could've also been passed in
                               # as an argument. Like what we have below.
puts "----"

greeting("George", {age: 28, hair: "black"}) # Output "Hi my name is George.
                              # I'm 28 years old and my hair color is black."

puts "----"

=begin
So what exactly did we do above? We used Hash#empty? (returns boolean value)
to see whether the OPTIONAL PARAMETER, which is a HASH, has anything passed
into it.

After defining the method we called it twice. Once without passing
anything into the OPTIONAL PARAMETER, and the second time passing in a HASH
into the OPTIONAL PARAMETER.

This Ruby feature can make our methods more expressive and dynamic.

*** What's also interesting is that if we choose to pass in the entire HASH
as an argument, we can do so WITHOUT having the curly braces {}, let's see
this in action below.
=end

greeting("George", age: 28, hair: "black") # Output "Hi my name is George.
                              # I'm 28 years old and my hair color is black."

puts "----"

# HASHES VS ARRAYS
