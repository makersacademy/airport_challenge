Dir["./lib/*.rb"].each {|file| require file }

air_traffic_controller = AirTrafficController.new

aeroplane1 = Aeroplane.new
aeroplane2 = Aeroplane.new
aeroplane3 = Aeroplane.new

airport1 = Airport.new
airport2 = Airport.new

weather = Weather.new

puts air_traffic_controller.ask_plane_to_land(aeroplane1, airport1, weather)
puts air_traffic_controller.ask_plane_to_land(aeroplane2, airport2, weather)
puts air_traffic_controller.ask_plane_to_land(aeroplane3, airport2, weather)

puts "Weather is stormy?: #{weather.stormy?}"
puts "aeroplane1 has landed: #{aeroplane1.landed}"
puts "aeroplane2 has landed: #{aeroplane2.landed}"
puts "aeroplane3 has landed: #{aeroplane3.landed}"
puts "airport1 has: #{airport1.aeroplanes}"
puts "airport2 has: #{airport2.aeroplanes}"


puts air_traffic_controller.ask_plane_to_take_off(aeroplane1, airport1, weather)
puts air_traffic_controller.ask_plane_to_take_off(aeroplane2, airport2, weather)

puts "Weather is stormy?: #{weather.stormy?}"
puts "aeroplane1 is flying: #{aeroplane1.flying}"
puts "aeroplane2 is flying: #{aeroplane2.flying}"
puts "aeroplane3 has landed: #{aeroplane3.landed}"
puts "airport1 has: #{airport1.aeroplanes}"
puts "airport2 has: #{airport2.aeroplanes}"


