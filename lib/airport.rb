require_relative 'plane'
require_relative 'weather' #allows use of Weather class methods


class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 3

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new, planes = [])
    @capacity = capacity
    @planes = planes
    @weather = weather
  end

  def land(plane)
    fail 'airport is full' if full?
    fail 'plane already grounded' if !plane.in_air? or plane_in_hangar?(plane)
    fail 'cannot land: stormy weather' if stormy?
    plane.ground
    @planes << plane
  end

  def take_off(plane)
    fail 'cannot take-off: stormy weather' if stormy?
    fail 'cannot take-off: plane not at airport' if plane.in_air? or !plane_in_hangar?(plane)
    @planes.delete(plane)
    plane.airborn
    take_off_confirmation(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def plane_in_hangar?(plane)
    planes.include?(plane)
  end

  def take_off_confirmation(plane)
    "#{plane} has successfully taken off"
  end

  def stormy?
    @weather.create == 2 ? true : false
  end

end
