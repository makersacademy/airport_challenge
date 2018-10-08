require_relative "Plane"
require_relative "Airport"
require_relative "Traffic_Controller"
require_relative "Passanger"
require_relative "Flight"

@plane0001 = nil
@airportGatwick = nil
@gatwickTrafficControl = nil
@airportHeathrow = nil
@heathrowTrafficControl = nil
@passanger = nil
@flight = nil
def initialize_objs()
  @airportGatwick = Airport.new("Gatwick", "GTW", 15, 1000)
  @gatwickTrafficControl = Traffic_Controller.new(@airportGatwick)
  @airportHeathrow = Airport.new("Heathrow", "HRW", 18, 1200)
  @heathrowTrafficControl = Traffic_Controller.new(@airportHeathrow)
  @plane0001 = Plane.new("CG", 120, @airportGatwick, @airportHeathrow, "CG0001")
  @plane0002 = Plane.new("CG", 120, @airportHeathrow, @airportGatwick , "CG0002")
  @flight1 = Flight.new(@plane0001)
  @flight2 = Flight.new(@plane0002)
  @passanger = Passanger.new("Liam Kwammy")
end

def Main()
  initialize_objs()
  @plane0001.addPassanger(@passanger)
  @passanger.getPassangerFlight()
  @gatwickTrafficControl.planeTakeOff(@plane0001)
  puts @plane0001.getPlaneStatus()
  puts "# Journey Time is 1 hour # "
  @heathrowTrafficControl.planeLand(@plane0001)
  puts @plane0001.getPlaneStatus()
end

Main()