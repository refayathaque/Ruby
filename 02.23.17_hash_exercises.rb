=begin
1. Given a hash of family members, with keys as the title and an array of names
as the values, use Ruby's built-in select method to gather only immediate
family members' names into a new array.
=end

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

family.select! { |key, value| key == :sisters || key == :brothers }
p family.values.flatten

puts "----"

# Above we used Hash#select!, but the instructions told us to use Hash#select.

# Using Hash#select

immediatefamily = family.select { |key, value| key == :sisters || key == :brothers }
p immediatefamily.values.flatten

puts "----"

=begin
2. Look at Ruby's merge method. Notice it has two versions. What is the
difference between Hash#merge and Hash#merge! ? Write a program that uses both
and illustrate the differences.
=end

# Hash#merge does NOT mutate the caller (leaves original hash unmodified)
# Hash#merge! mutates the caller (modifies original hash)

hash1 = {a: 100, b: 200}
hash2 = {b: 250, c: 300}

p hash1.merge(hash2) # {:a=>100, :b=>250, :c=>300}
p hash1 # hash1 unmodified {:a=>100, :b=>200}

# *** Important to note that if no block is specfied, the value for entries
# with duplicate keys will be that of the other_hash (hash2 in our case). This
# is why the merge method returned :b=>250 (hash2) instead of :b=>200 (hash1).

puts "----"

p hash1.merge!(hash2) # {:a=>100, :b=>250, :c=>300}
p hash1 # hash1 modified {:a=>100, :b=>250, :c=>300}

# Same thing here, if no block is specified, entries with duplicate keys are
# overwritten with the values from the other_hash (hash2 in our case).

puts "----"

=begin
3. Using some of Ruby's built-in Hash methods, write a program that loops through
a hash and prints all of the keys. Then write a program that does the same
thing except printing the values. Finally, write a program that prints both
=end

movie_by_year = {:kill_bill_vol_1 => "2003",
  :stewart_little => "1999",
  :scarface => "1983",
  :stand_up_guys => "2012",
  :finding_dory => "2016"}

movie_by_year.each do |key, value|
  puts key
end

puts "----"

movie_by_year.each do |key, value|
  puts value
end

puts "----"

movie_by_year.each do |key, value| # Hash#each
  puts "#{key} was released in #{value}"
end

puts "----"

movie_by_year.each_key { |key| puts key } # Hash#each_key

puts "----"

movie_by_year.each_value { |value| puts value } # Hash#each_value

puts "----"

movie_by_year.each_pair { |key, value| puts "#{key} was released in #{value}" }
# Hash#each_pair

puts "----"

=begin
What method could you use to find out if a Hash contains a specific value in
it? Write a program to demonstrate this use.
=end

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

puts "What is Bob's occupation?"
response = gets.chomp
occupation = person[:occupation] # Returns value for key :occupation

if person.has_value?(response) # Hash#has_value? is a method that we can use to
                          # find out if a Hash contains a specific value in it.
  puts "That's right, Bob is a #{response}"
else
  puts "No, Bob is a #{occupation}"
end

puts "----"

=begin
Given the array below, write a program that prints out groups of words that
are anagrams. Anagrams are words that have the same exact letters in them
but in a different order. Your output should look something like this:
["demo", "dome", "mode"]
["neon", "none"]
(etc)
=end

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
hash = {} # Blank hash, will populate with code below

array.each do |element| # Must iterate over elements in 'words' array *
  key = element.chars.sort.join # First, we must create keys for 'hash'
  if hash.has_key?(key) # Conditional to check if hash already has the key,
                        # if hash already has the key then line below executed.
    hash[key].push(element) # Array#push inserts element into key-value pair's
                            # array (array already present if hash has key as
                            # can be seen in the line below).
  else # If hash does NOT already have the key then execute line below
    hash[key] = [element] # Adding a key-value pair to 'hash', value has to be
                          # an array because we will need to have multiple
                          # values per key (IE 'dome' and 'mode' must fall
                          # under the same key). '[element]' creates the
                          # key-value pair with the value as an array, as
                          # opposed to just 'element'.
  end # Closing conditional
end # Closing do..end block

hash.each do |key, value| # Must iterate over key-value pairs in 'hash'
  p values # ::p (instead of puts) because we need to print out the values
           # which are arrays.
end # Closing do..end block

=begin
*

String#chars is a method that returns an array of characters in str.
[1] pry(main)> a = "Hello"
=> "Hello"
[2] pry(main)> a.chars
=> ["H", "e", "l", "l", "o"]
*** Can also use String#split(//) and String#split(''), String#split is a
method that divides str into substrings based on a delimiter, returning an
array of these substrings.

Array#sort is a method that returns a new array created by sorting self
(alphabetically and numerically).

1] pry(main)> a = "hello"
=> "hello"
[2] pry(main)> a.chars
=> ["h", "e", "l", "l", "o"]
[3] pry(main)> a.chars.sort
=> ["e", "h", "l", "l", "o"]

[4] pry(main)> a = [6, 3, 2, 9]
=> [6, 3, 2, 9]
[5] pry(main)> a.sort
=> [2, 3, 6, 9]
[6] pry(main)>

Array#join is a method that returns a string created by converting each
element of the array to a string, separated by the given separator.

[8] pry(main)> a
=> [6, 3, 2, 9]
[9] pry(main)> a.join
=> "6329"
[10] pry(main)> a.join("<")
=> "6<3<2<9"

=end
