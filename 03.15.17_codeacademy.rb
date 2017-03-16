# Example of USER INPUT REDACTION

puts "Enter some text please."
  text = gets.chomp.downcase
puts "What part of the text would you like to redact?"
  redact = gets.chomp

words = text.split # ['hello', 'how', 'are', 'you']

words.each do |element|
  if element != redact && element != words.last
    print element + " "
  elsif element == words.last && element == redact
    puts 'REDACTED'
  elsif element == words.last
    puts element
  else
    print 'REDACTED' + " "
  end
end

# Why so much code above? It's to make sure that we get a
# NEW LINE after every possible iteration.

# Example of a HISTOGRAM

puts "Please enter some text"
text = gets.chomp

words = text.split(" ") # Returns an array ['tomato', 'tomato', 'grape',
                        # 'cherry', 'apple', 'apple', 'apple']

frequencies = Hash.new(0) # 0 is the default value, we need to have the default
                          # value here as 0, of our code below. We need the
                          # value in the hash to start from 0 so we can increment
                          # every time an element appears more than once.

words.each do |element|
  frequencies[element] += 1
end

p frequencies





#frequencies = frequencies.sort_by {|a, b| b }
#frequencies.reverse!
#frequencies.each { |word, frequency| puts word + " " + frequency.to_s }

# tomato tomato grape cherry apple apple apple
