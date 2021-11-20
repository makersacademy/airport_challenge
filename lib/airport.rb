require_relative 'plane'
require_relative 'air_control.rb'

class Airport
  include AirportControl
  def take_off
  end

end

# require_relative 'plane.rb'
# require_relative 'air_control.rb'
# class Airport
#   include AirportControl
#   @@landed_planes = []
#   def initialize(name, capacity)
#     @name = name
#     @capacity = capacity
#   end
#   def take_off
#     check_weather
#     if check_weather == "Clear" && @flight_status != "Flying"
#       "#{} has taken off!"
#     else
#       raise "Sorry, conditions must be clear before take off"
#     end
#   end
#   def simple
#     "stringss"
#   end
# end
