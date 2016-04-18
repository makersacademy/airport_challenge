# Feature tests

cdg = Airport.new("CDG", Plane)
lhr = Airport.new("LHR", Plane)

puts "Creation of the airports"
puts "Planes at #{cdg.name}:\n#{cdg.planes}"
puts "Planes at #{lhr.name}:\n#{lhr.planes}"
puts

puts "A plane from CDG is ready for taking off if the weather is sunny"
plane1 = cdg.planes.first
plane1.take_off(cdg)
puts

puts "If weather was fine, CDG must have only 1 plane (2 if stormy)"
puts "Planes at #{cdg.name}:\n#{cdg.planes}"
puts "Status of plane #{plane1}: #{plane1.status}"
puts

puts "At this point, LHR still has 2 planes landed"
puts "Planes at #{lhr.name}:\n#{lhr.planes}"
puts

puts "The plane that left CDG is about to land at LHR if the weather is sunny"
plane1.land(lhr)
puts "Status of plane #{plane1}: #{plane1.status}"
puts "Planes at #{lhr.name}:\n#{lhr.planes}"

# puts "A plane at CDG airport cannot take off from LHR"
p plane2 = cdg.planes.first
plane2.take_off(lhr)