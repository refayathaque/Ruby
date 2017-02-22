# HASHES

=begin
A HASH is a data structure which stores items by associated KEYs. Arrays,
on the other, stores items by an ordered index. Entries in a has are
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

We can have hashes with multiple key-value pairs

[1] pry(main)> newsyntax = {name:'Refayat', age:'27'}
=> {:name=>"Refayat", :age=>"27"}

Say we want to add another key-value pair

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

# What about retrieving key using value?

=end
