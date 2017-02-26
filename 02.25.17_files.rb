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

=begin
We delete files using the method ::delete.

[1] pry(main)> File.open("file2.txt", "w+")
=> #<File:file2.txt>
[2] pry(main)> File.delete("file2.txt")
=> 1

How can we copy the contents of a file into a new file?

[1] pry(main)> original = File.read("file.txt")
=> "This is line 1.\nThis is line 2.\nThis is line 3.\nThis is line 4.\nThis is line 5.\nThis is line 6.\nThis is line 7.\n"
[2] pry(main)> newfile = File.open("file_copy.txt", "w+")
=> #<File:file_copy.txt>
[3] pry(main)> File.open(newfile, "w+") do |file|
[3] pry(main)*   file << original
[3] pry(main)* end
=> #<File:file_copy.txt (closed)>
[4] pry(main)> File.read("file_copy.txt")
=> "This is line 1.\nThis is line 2.\nThis is line 3.\nThis is line 4.\nThis is line 5.\nThis is line 6.\nThis is line 7.\n"

=end

# OVERVIEW OF FILE CLASSES

=begin
It all comes down to the RIGHT STUFF being in the RIGHT KIND OF FILES in the
RIGHT PLACE. By RIGHT KIND OF FILES we mean the type of file, referred to as
the file's FORMAT or EXTENSION. By being in the RIGHT PLACE we mean that it
is located in a recognizable DIRECTORY STRUCTURE or PATH.

In Ruby, the File class is a SUBCLASS of IO, a class responsible for
representing BIDIRECTIONAL STREAMS (IO stands for Input/Output). Some IO
streams include `STDOUT`, `STDIN`, and `STDERR`, that stand for "standard
output", "standard input", and "standard error", respectively.

[1] pry(main)> File.superclass
=> IO
[2] pry(main)> $stdout
=> #<IO:<STDOUT>>
[3] pry(main)> $stdin
=> #<IO:<STDIN>>
[4] pry(main)> $stderr
=> #<IO:<STDERR>>

Ruby offers us a few classes to interface with files and the file system.
In addition to `File` class, there's `Dir, which is an interface for
manipulating directories and their contents. Another class that is helpful
in linking files and directories is `Pathname`.

What if we want to move a file from a directory into a NEW sub-directory in
that directory?

[3] pry(main)> Dir.mkdir("NewDirectory", 0700) # Create NEW directory
=> 0
[4] pry(main)> Dir.open("NewDirectory") do |dir|
[4] pry(main)*   FileUtils.mv "file.txt", dir # Move file to NEW directory
[4] pry(main)* end
=> 0
[5] pry(main)> exit
Sun Feb 26 cd NewDirectory/
Sun Feb 26 ls
file.txt # The file has been moved

What if we want to check a directory for certain extensions. IE Let's check
the current directory to see what our Ruby (.rb) files are.

[3] pry(main)> d = Dir.new(".") # ::new returns a new directory object for
                                  the named directory.
=> #<Dir:.>
[4] pry(main)> while file = d.read do
[4] pry(main)*   puts "#{file} has extension rb" if File.extname(file) == ".rb"
[4] pry(main)* end
01.12.17_hash_ex_ch1ex3and4.rb has extension rb
01.12.17_hash_movie_by_year.rb has extension rb
01.12.17_string_interpolation.rb has extension rb
01.14.17_operations_ch1ex2and4and5.rb has extension rb
01.14.17_variables.rb has extension rb
01.17.17_variable_scope.rb has extension rb
01.19.17_user_input_ex_ch2ex1to4.rb has extension rb
01.22.17_variable_scope_ch2ex5and6.rb has extension rb
01.23.17_methods.rb has extension rb
01.30.17_method_ex_ch3.rb has extension rb
02.01.17_flow_control.rb has extension rb
02.01.17_flow_control_ex_ch4.rb has extension rb
02.06.17_loops_and_iterators.rb has extension rb
02.10.17_loops_and_iterators_exercises.rb has extension rb
02.14.17_arrays.rb has extension rb
02.19.17_arrays_exercises.rb has extension rb
02.20.17_hashes.rb has extension rb
02.23.17_hash_exercises.rb has extension rb
02.25.17_files.rb has extension rb
anagram1.rb has extension rb
anagram2.rb has extension rb
anagram_exercise.rb has extension rb
fizzbuzz.rb has extension rb
test.rb has extension rb
=> nil

=end
