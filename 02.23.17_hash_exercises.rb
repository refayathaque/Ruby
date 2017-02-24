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
