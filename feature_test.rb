# feature test
Dir['./lib/*'].each {|file| require file}

airport= Airport.new
plane= Plane.new
puts "I'm a Traffic Controler and I can see the #{plane} is approaching my empty #{airport}"

puts "the #{plane}:     ...............................................   -/--'  ....I'm r..r..rrrready to land! Can I land here, please?"
puts "TC:            Copy that! Permission: #{plane.may_i_land?(true)}"
airport.landing(plane)
puts "Airport status: #{airport.status}"
puts "- - - tic - - toc - - tic - - toc - - tic - -toc- -"

puts "TC:     there comes another plane!"
another_plane= Plane.new
puts "the #{another_plane}:     .....................................................................   -/--'  ....I'm r..r..rrrready to land! Can I land here, please?"
puts "TC:            Copy that! Permission: #{another_plane.may_i_land?(true)}"
airport.landing(another_plane)
puts  "Airport status: #{airport.status}"

puts "The plane wants to take off"
puts "TC:            Copy that! Permission: #{plane.may_i_take_off?(true)}"
airport.taking_off(plane)
p airport.status
#p "The plane LEFT the airport!!" if plane.take_off?
# puts "-/--'"





