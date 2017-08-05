# feature test
Dir['./lib/*'].each {|file| require file}

puts "- - - - - -  feature test  - - - - - - -  "
puts "Plane arrives at the Airport:"
plane= Plane.new
weather= Weather.new
puts "  "
puts " "
puts "                                   -/--' "
puts "                      -/--' "
puts "        -/--' "
puts ". . . . . . "
puts "#{airport= Airport.new}"
puts "Permission to land? :#{plane.permission?}"
p airport.landing(plane)
p plane
puts " "
puts "Plane is taking off:"

puts "Permission to take off? :#{plane.permission?}"
p "nice weather ?: #{weather.bad?}"
p airport.taking_off(weather.bad?)
p plane
puts " "
puts "                                  '--/- "
puts "                     '--/-"
puts "        '--/-"
puts ". . . . . . "
puts "#{airport} :Airport status"
puts ""











