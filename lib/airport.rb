require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    raise "Too stormy to land!" if Weather.new.report == "stormy"
    @hangar << plane
  end

  def takeoff(plane)
    raise "Too stormy to take off!" if Weather.new.report == "stormy"
    @hangar.delete(plane)
    "#{plane} has taken off"
  end

end
