require_relative "airport"
require_relative "plane"
require_relative "air_traffic_controller"
require_relative "weather_service"

weather_service = Weather_Service.new
heathrow = Airport.new("Heathrow",100)
gatwick = Airport.new("Gatwick",80)
airbus_a380 = Plane.new("Airbus_A380")
controller = Air_Traffic_Controller.new

puts "new plane"
p airbus_a380


puts "planes in airport"
p heathrow

puts "land in heathrow"
puts controller.instruct_plane_to_land(heathrow, airbus_a380, weather_service)

puts "planes in airport after landing"
p heathrow

puts "land in heathrow again"
puts controller.instruct_plane_to_land(heathrow, airbus_a380, weather_service)
p airbus_a380

puts "take off from gatwick"
puts controller.instruct_plane_to_take_off(gatwick, airbus_a380, weather_service)
p airbus_a380

puts "take off from heathrow"
puts controller.instruct_plane_to_take_off(heathrow, airbus_a380, weather_service)
p airbus_a380
p heathrow
