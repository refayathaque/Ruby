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
