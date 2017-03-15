# Example of USER INPUT REDACTION

puts "Enter some text please."
  text = gets.chomp
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
