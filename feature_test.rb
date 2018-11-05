Dir["./lib/*.rb"].each {|file| require file }
sky = []
air_traffic_controller = AirTrafficController.new

aeroplane1 = Aeroplane.new

aeroplane2 = Aeroplane.new

aeroplane3 = Aeroplane.new

airport1 = Airport.new

airport2 = Airport.new

sky = Sky.new

air_traffic_controller.ask_plane_to_land(aeroplane1, airport1, sky.weather)
air_traffic_controller.ask_plane_to_land(aeroplane2, airport2, sky.weather)
air_traffic_controller.ask_plane_to_land(aeroplane3, airport2, sky.weather)

puts "Weather #{sky.weather}"
puts "aeroplane1 has landed: #{aeroplane1.landed}"
puts "aeroplane2 has landed: #{aeroplane2.landed}"
puts "aeroplane3 has landed: #{aeroplane3.landed}"
puts "airport1 has: #{airport1.aeroplanes}"
puts "airport2 has: #{airport2.aeroplanes}"

sky.add_aeroplane(air_traffic_controller.ask_plane_to_land(aeroplane1, airport1, sky.weather))
sky.add_aeroplane(air_traffic_controller.ask_plane_to_land(aeroplane2, airport2, sky.weather))
sky.add_aeroplane(air_traffic_controller.ask_plane_to_land(aeroplane3, airport2, sky.weather))

puts "planes currently in flight #{sky.inflight_planes}"

