=begin Write a program that uses a hash to store
a list of movie titles with the year they came out.
Then use the 'puts' command to make your program
print out the year of each movie to the screen.
=end

movie_by_year = {:kill_bill_vol_1 => "2003",
  :stewart_little => "1999",
  :scarface => "1983",
  :stand_up_guys => "2012",
  :finding_dory => "2016"}

puts movie_by_year[:kill_bill_vol_1]
puts movie_by_year[:stewart_little]
puts movie_by_year[:scarface]
puts movie_by_year[:stand_up_guys]
puts movie_by_year[:finding_dory]

# The above prints the years of the movies

puts "----"

# Below is another way of doing the same thing, but with the 'each' ITERATOR
# The 'each' ITERATOR returns all the elements of a hash or an array

movie_by_year.each do |key, value|
  puts value
end

puts "----"

=begin Use the dates from the above example and
store them in an array. Then make your program
output the same thing as the above example.
=end

movie_by_year_array = [2003, 1999, 1983, 2012, 2016]

puts movie_by_year_array[0]
puts movie_by_year_array[1]
puts movie_by_year_array[2]
puts movie_by_year_array[3]
puts movie_by_year_array[4]

puts "----"

# Same thing but with the 'each' ITERATOR

movie_by_year_array.each do |element|
  puts element
end
