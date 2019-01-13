require './lib/weather'

class Airport
  include Weather
  attr_reader :hanger_capacity

  DEFAULT_HANGER_CAPACITY = 100

  def initialize(hanger_capacity = DEFAULT_HANGER_CAPACITY)
    @hanger = []
    @hanger_capacity = hanger_capacity
  end

  def land(landing_plane)
    fail "Too stormy for landing" if stormy_weather?
    fail "Plane has already landed" if in_hanger?(landing_plane)
    fail "Plane is not in air" if landing_plane.landed?
    fail "Airport is full" if airport_full?
    landing_plane.set_landed(true)
    @hanger << landing_plane
  end

  def take_off(taking_off_plane)
    fail "Too stormy for take off" if stormy_weather?
    fail "Plane not in hanger" if in_hanger?(taking_off_plane) == false
    taking_off_plane.set_landed(nil)
    @hanger.delete(taking_off_plane)
  end

  def in_hanger?(plane)
    @hanger.include?(plane)
  end

private

  def airport_full?
    return true if @hanger.length >= @hanger_capacity
  end

end
