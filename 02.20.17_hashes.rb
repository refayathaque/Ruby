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

=begin
We need to ask ourselves some key questions when deciding whether to use a
HASH or an array.

1. Does this data need to be associated with a specific label? If yes, then
use a HASH. If the data doesn't have a natural label then use an array.

2. Does order matter? If so, then use an array. In Ruby 1.9 HASHES also
maintain order, but ordered items are usually stored in arrays.

3. Do we need a "stack" or a "queue" structure? Arrays are good at mimicking
simple "first-in-first-out" queues, or "last-in-first-out" stacks. (???)
=end

# HASH KEYs

=begin
So far we've been using symbols (key:) as our keys, and this is the most
common use case in the wild. However, it is possible to use different data
types as keys. IE strings, arrays, integers, floats, and even HASHES. HASHES
can be very diverse, and we can pretty much store whatever we want in them.

*** We must use the OLD HASH SYNTAX ({:name=>'Refayat'}) when using anything
other than symbols and strings as keys.

Let's look at some examples below.

[1] pry(main)> {"greeting": "Hello"} # Strings work with new and old syntax
=> {:greeting=>"Hello"}

[2] pry(main)> {["greeting"]=> "Hello"} # Array
=> {["greeting"]=>"Hello"}
[3] pry(main)> {1=> "Hello"} # Integer
=> {1=>"Hello"}
[4] pry(main)> {1.2=> "Hello"} # Float
=> {1.2=>"Hello"}
[5] pry(main)> {{greeting: "Hello"}=> "Hello"} # HASH
=> {{:greeting=>"Hello"}=>"Hello"}
=end

# COMMON HASH METHODs

=begin
Hash#has_key? method allows us to check the has for a specific key, returning
a boolean value. Let's see this in action below.

[1] pry(main)> hash = {1.45=> "George", name: "Harriet"}
=> {1.45=>"George", :name=>"Harriet"}
[2] pry(main)> hash.has_key?(1.45)
=> true

Hash#select method allows us to find key-value pairs that meet conditions set
by a block. The method returns any key-value pairs which evaluate to true when
ran through the block. Hash#select is an iterator.

[2] pry(main)> name_and_age = {"Bob" => 42, "Steve" => 31, "Joe" => 19}
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}
[3] pry(main)> name_and_age.select {|key, value| key=="Bob" || value==31}
=> {"Bob"=>42, "Steve"=>31}
[6] pry(main)> name_and_age.select {|key, value| key=="Steve" && value==31 }
=> {"Steve"=>31}



=end
