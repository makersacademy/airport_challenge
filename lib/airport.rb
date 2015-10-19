require 'weather'

class Airport
  DEFAULT_CAPACITY = 30
  attr_accessor :capacity
  attr_reader :hangar
  include Weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise "Unable to land plane: max capacity has been reached." if @hangar.count >= @capacity
    raise "Unable to land plane: weather is stormy." if stormy?
    raise "Unable to land plane: plane is either not in flight or is already in an airport." if not plane.flying? or plane.location != "Airborne"
    @hangar << plane
  end

  def take_off(plane)
    raise "Unable to take-off: weather is stormy." if stormy?
    raise "Unable to take-off: this plane is not in this airport!" if @hangar.none? {|planes_in_hangar| planes_in_hangar == plane} or plane.location == "Airborne"
    @hangar.delete_if{|plane_in_hangar| plane_in_hangar == plane}
    plane
  end

end