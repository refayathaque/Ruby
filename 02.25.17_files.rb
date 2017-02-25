# FILES

=begin
Up till now, Ruby code we've worked through allowed us to express data in
memory, but after exiting out of PRY, the variables and objects go away. Files
are different, files can exist before and after a program runs. Files can also
be shared and validated to formats that have nothing in common with one another.
=end

# CREATING A FILE

=begin
We create files using the method ::new (opens the file named by filename
according to the given mode and returns a new File object). We pass the name
of the file and the mode we want to assign to `File.new`.
Modes: 'r' is Read-Only
       'w' is Write-Only (truncates existing file to 0 length, overwrites all)
       'w+' is Read-Write ( " )
       'a' is Write-Only (starts at end of file if it exists, otherwise creates
           new file, updates files)
       'a+' is Read-Write ( " )
Let's try creating a new file in PRY.

[1] pry(main)> file = File.new("file.txt", "w+")
=> #<File:file.txt>
[2] pry(main)> file.close
=> nil

In the example above we created a new file called `file.txt` and mode `w+` for
Read-Write access to the file. *** File is created in the directory from which
PRY was opened. We also closed the file after, we ALWAYS WANT TO CLOSE FILES.
Open files occupy space in memory.

In the past we only knew how to create files from the terminal using 'touch',
now we can create files in PRY with specific modes.
=end

# OPENING FILES

=begin
We open an existing file using method ::open. *** With no associated block,
`File.open` is a synonym for ::new. We open an existing file using 'File.open'
and will pass the file name and a second argument which will decide how the
file will be opened (r, w, w+, a, a+).

If we want to read the contents in a file we can use methods ::read and
::readlines. `File.read` returns the entire contents of the file, while
`File.readlines` reads the entire file based on individual lines and returns
those lines in an array. Let's try this out in PRY.

[1] pry(main)> File.read("file.txt")
=> "This is line 1.\nThis is line 2.\nThis is line 3."
[2] pry(main)> File.readlines("file.txt")
=> ["This is line 1.\n",
 "This is line 2.\n",
 "This is line 3."] # Returns lines in an array

*** File is a SUBCLASS of IO, and the ONLY STANDARD SUBCLASS

Now we will add content to 'file.txt', and we can use ::write or IO#puts to
write files. `Puts` adds a line break to the end of strings, while `write`
does not. Let's try below.

*** Ruby will automagically close the file if the open method is called with a
    block.

[4] pry(main)> File.open("file.txt", "a+") { |file| file.write("This is line 4.\n") }
=> 16
[5] pry(main)> File.readlines("file.txt")
=> ["This is line 1.\n",
    "This is line 2.\n",
    "This is line 3.\n",
    "This is line 4.\n"]
Here we used ::write to add content, our mode was 'a+' because we wanted to
update the file (add more lines), NOT overwrite everything. Since we used
::write we had to add '\n' after the end of the string to have a line break.

[6] pry(main)> File.open("file.txt", "a+") { |file| file.puts("This is line 5.") }
=> nil
[7] pry(main)> File.readlines("file.txt")
=> ["This is line 1.\n",
    "This is line 2.\n",
    "This is line 3.\n",
    "This is line 4.\n",
    "This is line 5.\n"]
Here we used IO#puts to add content, our mode was 'a+' because we wanted to
update the file (add more lines), NOT overwrite everything. Since we used
IO#puts we get line breaks after the string, we don't need '\n' at the end.

We can also add content WITHOUT a block. Let's try this below. *** Since we're
not using a block we must close the file manually at the end.

[1] pry(main)> workingfile = File.open("file.txt", "a+")
=> #<File:file.txt>
[2] pry(main)> workingfile.puts("This is line 6.")
=> nil
[3] pry(main)> workingfile.close
=> nil
[4] pry(main)> File.readlines("file.txt")
=> ["This is line 1.\n",
 "This is line 2.\n",
 "This is line 3.\n",
 "This is line 4.\n",
 "This is line 5.\n",
 "This is line 6.\n"]

Like ::write, we can also use << (shovel operator) to add content (also won't
have a line break after string).

[5] pry(main)> File.open("file.txt", "a+") do |file|
[5] pry(main)*   file << "This is line 7.\n"
[5] pry(main)* end
=> #<File:file.txt (closed)>
[6] pry(main)> File.readlines("file.txt")
=> ["This is line 1.\n",
 "This is line 2.\n",
 "This is line 3.\n",
 "This is line 4.\n",
 "This is line 5.\n",
 "This is line 6.\n",
 "This is line 7.\n"]

Above, we opened the file for reading and updating with 'a+' mode, we
declared a variable `file` as a placeholder for the file and appended more
content with the shovel operator.

So we know that ::read will just return the entire contents of the file, and
::readlines reads the entire file based on individual lines and returns
those lines in an array. What if we want neither of those things? What if we
want the content printed in their individual lines? We can do this using the
IO#each iterator, IN ADDITION TO, ::readlines, we will call IO#each on
::readlines with a block (variable |line|). Since we will be using :readlines
what will be returned are the lines in an array. Let's try this out.

[4] pry(main)> File.readlines("file.txt").each do |line|
[4] pry(main)*   puts line
[4] pry(main)* end
This is line 1.
This is line 2.
This is line 3.
This is line 4.
This is line 5.
This is line 6.
This is line 7.
=> ["This is line 1.\n",
 "This is line 2.\n",
 "This is line 3.\n",
 "This is line 4.\n",
 "This is line 5.\n",
 "This is line 6.\n",
 "This is line 7.\n"]

We can also do this using `each_with_index`. Let's remember to have TWO
variables as placeholders for each line and its line index. Let's try.

[10] pry(main)> File.readlines("file.txt").each_with_index do |line, linenum|
[10] pry(main)*   puts "#{linenum + 1}: #{line}"
[10] pry(main)* end
1: This is line 1.
2: This is line 2.
3: This is line 3.
4: This is line 4.
5: This is line 5.
6: This is line 6.
7: This is line 7.
=> ["This is line 1.\n",
 "This is line 2.\n",
 "This is line 3.\n",
 "This is line 4.\n",
 "This is line 5.\n",
 "This is line 6.\n",
 "This is line 7.\n"]

=end

# DELETING A FILE
