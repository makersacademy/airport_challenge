
require './lib/weather'
require './lib/plane'




class Airport

  def initialize
  @weather = Weather.new.met_report
  #@plane_inv = []
  #@max_cap = 1
  end

  def land(plane)
    @plane = plane

  end

  def take_off(plane)
    #raise "Unable to take off due to bad weather!" if @weather == "stormy"
    return "Plane has taken off"

  end
end
