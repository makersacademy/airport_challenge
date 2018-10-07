
require './lib/weather'
require './lib/plane'




class Airport

  def initialize
  @weather = Weather.new.met_report
  #@plane_inv = []
  @max_cap = []
  end

  def land(plane)
    raise "Airport full" unless @max_cap.length < 1
    @max_cap << plane
    return "Plane has landed"

  end

  def take_off(plane)
    #raise "Unable to take off due to bad weather!" if @weather == "stormy"
    return "Plane has taken off"

  end
end
