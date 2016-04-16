# Feature tests

cdg = Airport.new("CDG", Plane)
lhr = Airport.new("LHR", Plane)

puts "Creation of the airports"
puts "Planes at #{cdg.name}:\n#{cdg.planes}"
puts "Planes at #{lhr.name}:\n#{lhr.planes}"
puts

puts "A plane is ready for taking off if the weather is sunny"
plane1 = cdg.planes.first
puts plane1.take_off(cdg)
puts

puts "CDG has now only 1 plane"
puts "Planes at #{cdg.name}:\n#{cdg.planes}"
puts

# After releasing the plane, the plane status is :flying and is not anymore
# on the available planes for that airport
puts "Status of plane #{plane1}: #{plane1.status}"
puts "Planes at #{cdg.name}:\n#{cdg.planes}"
puts

puts "At this point, LHR still has 2 planes landed"
puts "Planes at #{lhr.name}:\n#{lhr.planes}"
puts

puts "The plane that left CDG is about to land at LHR if the weather is sunny"
puts plane1.land(lhr)
puts "Status of plane #{plane1}: #{plane1.status}"
puts "Planes at #{lhr.name}:\n#{lhr.planes}"





