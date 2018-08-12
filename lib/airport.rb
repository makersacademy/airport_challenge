require_relative "plane"
require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 1
  attr_reader :hangar
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise "Too stormy to land!" if Weather.new.report == "stormy"
    @hangar << plane
  end

  def takeoff(plane)
    raise "Too stormy to take off!" if Weather.new.report == "stormy"
    raise "Error: plane is not at the airport" if plane_present?(plane) == false
    @hangar.delete(plane)
    "#{plane} has taken off"
  end

  private

  def plane_present?(plane)
    @hangar.include?(plane)
  end
end
