# HASHES

=begin
A HASH is a data structure which stores items by associated KEYs. Arrays,
on the other, store items by an ordered index. Entries in a HASH are
referred to as 'key-value pairs'. HASHES are created using symbols (:)
as keys and any data types as values. Key-value pairs in a HASH are
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

Say we wanted to retrieve a piece of information from a HASH

[7] pry(main)> newsyntax[:hair]
=> "black"

What if we wanted to retrieve the corresponding key of a specific value?

# We use the Hash#key method.

[11] pry(main)> newsyntax.key("Refayat")
=> :name

Say we wanted to merge two HASHes together. How would we do that?

# We use the Hash#merge! method if we want to mutate the caller. And
# Hash#merge method if we dont want to mutate the caller, IE leave the
# original HASH unmodified.

[12] pry(main)> newsyntax
=> {:name=>"Refayat", :hair=>"black"}
[13] pry(main)> newHASH = {city: 'Washington DC', car: 'BMW'}
=> {:city=>"Washington DC", :car=>"BMW"}
[15] pry(main)> newsyntax.merge!(newHASH)
=> {:name=>"Refayat",
 :hair=>"black",
 :city=>"Washington DC",
 :car=>"BMW"}
[16] pry(main)> newsyntax
=> {:name=>"Refayat",
 :hair=>"black",
 :city=>"Washington DC",
 :car=>"BMW"}
[17] pry(main)> newHASH
=> {:city=>"Washington DC", :car=>"BMW"}

We called Hash#merge! on Hash ‘newsyntax’ and passed in Hash ‘newHASH’ as an
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

[1] pry(main)> HASH = {1.45=> "George", name: "Harriet"}
=> {1.45=>"George", :name=>"Harriet"}
[2] pry(main)> HASH.has_key?(1.45)
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

We already know how to retrieve values based on their corresponding keys.

[5] pry(main)> name_and_age
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}
[6] pry(main)> name_and_age["Steve"]
=> 31

We can also do this using the method Hash#fetch. This method allows us to
pass a given key and it will return the value for that key if it exists. We
can also specify an option for return if the particular key isn't present.

[8] pry(main)> name_and_age
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}
[9] pry(main)> name_and_age.fetch("Bob")
=> 42
[10] pry(main)> name_and_age.fetch("Doug", "Doug isn't in the HASH") # We
# specfied an option here in case "Doug" isn't a key in the HASH.
=> "Doug isn't in the HASH" # Since "Doug" isn't a key in the HASH.

We can also specify an option for return if the particular key isn't present
with a BLOCK.

[1] pry(main)> name_and_age = {"Bob" => 42, "Steve" => 31, "Joe" => 19}
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}
[2] pry(main)> name_and_age.fetch("Doug")
{ |element| "Doug isn't in the HASH, #{element}"}
=> "Doug isn't in the HASH, Doug"

It is important to keep in mind that even though we are dealing with HASHes
when using Hash#fetch with the BLOCK we set the variable like how it's done
with arrays, there will be only one variable IE |element|. Following the
variable will be the option for return if the particular key isn't present.
Since we have a variable we can do String Interpolation and print the
variable in the option string.

Say we want to convert a HASH into an array, we can use the method Hash#to_a.
This method does NOT mutate the caller however.

[1] pry(main)> name_and_age = {"Bob" => 42, "Steve" => 31, "Joe" => 19}
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}
[2] pry(main)> name_and_age.to_a
=> [["Bob", 42], ["Steve", 31], ["Joe", 19]]
[3] pry(main)> name_and_age
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19} # Does NOT mutate the caller

Lastly, if we want to just retrieve all keys or values from a HASH we can
do that easily using the methods Hash#keys and Hash#values.

[5] pry(main)> name_and_age.keys
=> ["Bob", "Steve", "Joe"]
[6] pry(main)> name_and_age.values
=> [42, 31, 19]

These two methods return arrays, so if we want to list them out we are going
to have to be creative. Since they return arrays we can use an Array iterator
method with a block and have the block print each element in the array.
=end

name_and_age = {"Bob" => 42, "Steve" => 31, "Joe" => 19}

name_and_age.keys.each { |element| puts element}

# Prints "Bob, Steve, Joe"

puts "----"

name_and_age.values.each { |element| puts element}

# Prints "42, 31, 19"

puts "----"

# *** Very useful example...

# Given the following data structures. Write a program that moves the
# information from the array into the empty hash that applies to the correct
# person.

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contact_data.each do |element|
  if element.include?("joe@email.com")
    contacts["Joe Smith"] = element
  else
    contacts["Sally Johnson"] = element
  end
end

p contacts

puts "----"

=begin
Output:
{"Joe Smith"=>["joe@email.com", "123 Main st.", "555-123-4567"],
"Sally Johnson"=>["sally@email.com", "404 Not Found Dr.", "123-234-3454"]}

So we just moved the array elements (which are also arrays) to their respective
owners. But what if we wanted to have labels for the pieces of information? IE
'email address', 'address', and 'phone number'? We have to take another
approach. Let's try it out below.
=end

contactdata = [["joe@email.com", "123 Main st.", "555-123-4567"],
["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

people = {"Joe Smith" => {}, "Sally Johnson" => {}}

people["Joe Smith"][:emailaddress] = contactdata[0][0]
people["Joe Smith"][:homeaddress] = contactdata[0][1]
people["Joe Smith"][:phonenumber] = contactdata[0][2]
people["Sally Johnson"][:emailaddress] = contactdata[1][0]
people["Sally Johnson"][:homeaddress] = contactdata[1][1]
people["Sally Johnson"][:phonenumber] = contactdata[1][2]

p people

# We created NEW key-value pairs INSIDE the hashes that act as values to the
# keys "Joe Smith" and "Sally Johnson", instead of just inserting the
# elements (arrays containing our information) into the keys "Joe Smith" and
# "Sally Johnson". So our hash 'people' has two key-value pairs
# ("Joe Smith": {}, and "Sally Johnson": {}) with THEIR values being hashes
# with key-value pairs (emailaddress: "joe@email.com", etc.) INSIDE them.

puts "----"

# Using the hash you created from the previous exercise, demonstate how
# you would access Joe's email and Sally's phone number.

puts "Joe's email address is #{people["Joe Smith"][:emailaddress]}"
puts "Sally's phone number is #{people["Sally Johnson"][:phonenumber]}"

puts "----"

# In the example above we manually inserted the data into the hash, but what
# if we wanted to PROGRAMATICALLY insert the data into the hash? How would
# we go about doing that? We will need to do a 'LOOP INSIDE A LOOP'.

contacthash = {"Joe Smith"=>{}}

contactarray = ["joe@email.com", "123 Main st.", "555-123-4567"]

labelarray = [:email, :address, :phone]

contacthash.each do |key, _| # _ since we don't use 'value' in this block
  labelarray.each do |element|
    contacthash[key][element] = contactarray.shift
  end
end

p contacthash

puts "----"

# There's another way we can do this...

contacthasha = {"Joe Smith"=>{}}

contactarraya = ["joe@email.com", "123 Main st.", "555-123-4567"]

labelarraya = [:email, :address, :phone]

contacthasha.each do |_, value| # _ since we don't use 'key' in this block
  labelarraya.each do |element|
    value[element] = contactarraya.shift # Difference with example above...
  end
end

p contacthasha

puts "----"

# What if we wanted to do something similar but insert data into more than
# one key-value pair in a hash? Our process would be almost the same as above
# except for one key difference, and that is in line 398.

contactsarray = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
# Here we have two arrays IN AN array

contactshash = {"Joe Smith" => {}, "Sally Johnson" => {}}

labelsarray = [:email, :address, :phone]

contactshash.each do |key, value|
  contactsarray.flatten! # This method allows us to insert data into more
                         # than one key-value pair.
  labelsarray.each do |element|
    value[element] = contactsarray.shift
  end
end

p contactshash

=begin
Output:
{"Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.",
  :phone=>"555-123-4567"},
    "Sally Johnson"=>{:email=>"sally@email.com",
      :address=>"404 Not Found Dr.", :phone=>"123-234-3454"}}
=end

puts "----"
