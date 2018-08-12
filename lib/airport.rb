require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def takeoff(plane)
    raise "Too stormy to fly!" if Weather.new.report == "stormy"
    @hangar.delete(plane)
    "#{plane} has taken off"
  end

end
