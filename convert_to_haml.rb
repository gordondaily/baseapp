#! /usr/bin/ruby

require 'find'

if ARGV.size < 1
  puts "Please provide a target directory." 
else
  @target_dir = ARGV[1]
  res = `which html2haml`
  if res.nil? || res.empty?
    puts "Could not find html2haml.  Please ensure the haml gem is installed"; return
  end
  res.chop!
  @cmd = "for x in `find #{@target_dir} | grep erb`; do #{res} $x > `dirname $x`\"/\"`basename $x \".erb\"`\".haml\"; done"
  system(@cmd)
end
