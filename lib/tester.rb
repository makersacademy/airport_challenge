require './lib/airport.rb'

airport1 = Airport.new
airport2 = Airport.new(3)
planeslist = []
20.times do
  planeslist << Plane.new
end
system('clear')
puts "Planes available: #{planeslist.count}"
puts "Airports available: airport1 (capacity 20), airport2 (capacity 3)"
puts ""
puts "Available commands"
puts "land                - land plane"
puts "takeoff             - take off plane"
puts "view landed planes  - "
puts "---------------------------------------------------"
userinput = gets.chomp
userinputarray = userinput.split(" ")
