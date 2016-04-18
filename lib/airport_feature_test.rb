require_relative 'airport'
require_relative 'plane'
require_relative 'weather'

#This is still work in progress! Simpler plane objects need to be added;
#exception messages need to be displayed; the loop needs to work smoother
puts 'Please enter the capacity for the new airport (Integers values only)'
capacity = gets.chomp
new_airport = Airport.new(capacity)
docked_planes=[]
puts 'What would you like to do? : (l)and, (t)ake_off, (s)how_planes or e(x)it'
input = gets.chomp.downcase
while input != 'x'
  begin
    if input == 'l'
      plane = Plane.new
      new_airport.land_plane(plane)
      docked_planes << plane
    elsif input == 't'
      puts 'Please enter flight number'
      plane = gets.chomp
      new_airport.launch_plane(plane)
    elsif input == 's'
      puts docked_planes
    else
      puts 'Please enter a valid response'
    end
  rescue
    p RuntimeError
  end
  puts 'What would you like to do? : (l)and, (t)ake_off, (s)how_planes or e(x)it'
  input = gets.chomp.downcase
end
puts 'Goodbye!'

when ‘rescuing’ from an error message in the feature test, how do you display the exception message invoked by the corresponding class?

  do you store the exception message in the class and then access it from the executable feature test or is there a more elegant way of doing it?
