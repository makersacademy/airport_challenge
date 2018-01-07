class Airport
  require_relative 'plane'
  require_relative 'weather'

  attr_reader :airport
  attr_reader :weather
  attr_accessor :capacity

  DEFAULT_CAPACITY = 5

  def initialize(weather = Weather.new)
    @airport = []
    @weather = weather
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise 'Unable to land - stormy weather.' if weather.stormy?
    raise 'Unable to land - airport full.' if airport.count > capacity
    return add_plane(plane) if plane_in_hangar?(plane) == false
    raise 'Plane already at hangar'
  end

  def take_off(plane)
    raise 'Unable to take off - stormy weather.' if weather.stormy?
    take_off_confirmation(plane)
  end

private
  def take_off_confirmation(plane)
    @airport.delete(plane)
    "#{plane} no longer in airport."
  end

  def add_plane(plane)
    @airport << plane
  end

  def plane_in_hangar?(plane)
    @airport.include?(plane)
  end

end
