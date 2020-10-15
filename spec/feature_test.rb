# require 'airport'
# require 'plane'
#
# RSpec.describe Airport do
#   describe 'weather is calm then stormy for 3 actions, then calm' do
#     it 'does' do
#       given_4_planes_are_at_the_airport
#       when_the_weather_turns_bad
#       three_planes_are_turned_away
#       when_the_weather_turns_good
#       then_six_land
#       another_is_denied_landing
#       one_takes_off
#       then_another_lands
#     end
#   end
# end
#
# def given_4_planes_are_at_the_airport
#   airport = Airport.new
#   [*"1".."4"].each do |x|
#     x = Plane.new
#     airport.planes << x
#   end
# end
#
# def when_the_weather_turns_bad
#   allow_any_instance_of(rand).to receive(1)
# end
#
# def three_planes_are_turned_away
#   3.times {
#     plane = Plane.new
#     airport.land(plane)
#   }
# end
#
# def when_the_weather_turns_good
#   allow_any_instance_of(rand).to receive(5)
# end
#
# def then_six_land
#   [*"6".."10"].each do |x|
#     x = Plane.new
#     airport.land(x)
#   end
# end
#
# def another_is_denied_landing
#   eleven = Plane.new
#   airport.land(eleven)
# end
#
# def one_takes_off
#   airport.takeoff(6)
# end
#
# def then_another_lands
#   twelve = Plane.new
#   airport.land(twelve)
# end
