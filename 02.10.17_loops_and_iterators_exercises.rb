=begin
Ex. 2) Write a while loop that takes input from the user, performs an action, and only stops
when the user types "STOP". Each loop can get info from the user.
=end

a = "" # Line 11 below will ASSIGN this for line 8 with the 'while conditional'
       # to process.
while a != "STOP" # Once this becomes 'false', the LOOP will stop. What that means
                  # is once the user inputs "STOP" the LOOP will stop.
  puts "Hey how's it going?"
  a = gets.chomp # User input, ASSIGNs variable 'a' on line 6
end
