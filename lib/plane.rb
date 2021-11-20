require_relative 'airport'
require_relative 'air_control.rb'


class Plane
  include AirportControl
  attr_reader :model, :origin, :destination, :flight_status

  def initialize(model, origin, destination, flight_status)
    @model = model
    @origin = origin
    @destination = destination
    @flight_status = flight_status
  end

  def land(plane)
    landed_planes << plane
  end
end

#   def land(plane)
#     @@landed_planes << plane
#     @flight_status = "Landed"
#   end
# end
