require_relative 'weather'
require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 25

  def initialize
    @planes = []
  end

  def land(plane)
    fail "No room here mate" if full?
    weather_any_good
    plane.land
    @planes << plane
    "That was a bumpy landing sir"
  end

  def take_off
    fail "No planes here mate" if empty?
    weather_any_good
    planes.shift.take_off
    "Don't forget to send a postcard"
  end

  def planes_in_airport
    planes
  end

  private
  attr_reader :planes

  def weather_any_good
    fail "Not in this weather mate" unless Weather.sunny?
  end

  def full?
    planes.size >= DEFAULT_CAPACITY
  end

  def empty?
    planes == []
  end
end
