require_relative "Plane"
require_relative "Airport"
require_relative "Traffic_Controller"
require_relative "Passanger"
require_relative "Flight"

@plane = nil
def initialize_objs()
  @plane = Plane.new("CG", 120, "Gatwick", "Miami", "CG0901")
  #@airport = Airport.new
  #@passanger = Passanger.new
  #@flight = Flight.new
end

def Main()
  initialize_objs()
  puts @plane.getPlaneId()
end

Main()