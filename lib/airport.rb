require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane, :weather, :airport_apron, :capcity

  DEFAULT_CAPACITY = 20

  def initialize(weather, capcity = DEFAULT_CAPACITY)
    @weather = weather
    @airport_apron = []
    @capcity = capcity
  end

  def land(plane)
    @plane = plane
    landing_permission_check

    plane.land?
    airport_apron << plane
  end

  def take_off(index = 0)
    takeoff_permission_check

    taking_off_plane = airport_apron.delete_at(index)
    taking_off_plane.taken_off?
    taking_off_plane
  end

  private

  def landing_permission_check

    raise "it is stormy" if weather.stormy?

    raise "Error, the plane arleady in apron" if airport_apron.include?(plane)

    raise "airport apron is full" if airport_apron.size >= capcity
  end

  def takeoff_permission_check
    raise "it is stormy" if weather.stormy?
  end

end
