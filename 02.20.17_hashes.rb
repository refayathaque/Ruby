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

=end

# ITERATING OVER HASHES
