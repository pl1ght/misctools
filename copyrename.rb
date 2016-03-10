#!/usr/bin/env ruby
require 'fileutils'

# Takes a list of filenames in a file, and takes a source file and renames it to match each line in the list until done.  
# Good for mass copying/replacing files with a new template where the original filename must remain the same.

list = "filenamelist.txt"
template = "filetobecopiedrenamed"


File.open(list, 'r').readlines.each do |line|
    FileUtils.cp(template, line.chomp)
  end





