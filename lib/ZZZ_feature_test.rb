# Creation of two different airports with a capacity of 10 planes
# When initializing, each airport contains 2 planes
cdg = Airport.new("CDG", Plane)
lhr = Airport.new("LHR", Plane)

# A plane is ready for taking off if the weather is sunny
plane1 = cdg.planes.first
p plane1.take_off(cdg)

# After releasing the plane, the plane status is :flying and is not 
# on the available planes for that airport
p plane1
puts "Planes at #{cdg.name}: #{cdg.planes}"

# The plane that left cdg is about to land at lhr if the weather is sunny
p plane1.land(lhr)
p plane1
puts "Planes at #{lhr.name}: #{lhr.planes}"





