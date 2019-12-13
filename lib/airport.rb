require_relative 'plane'
require_relative 'weather'
class Airport
  attr_reader :hanger
  include(Weather)
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land_plane(plane)
    if full?
      raise "Landing rejected, over capacity"
    elsif !good_weather?
      raise "Bad Weather, cannot LAND"
    else
      plane.landed?(true)
      @hanger.push(plane)
      true
    end
  end

  def take_off(plane)
    @hanger.delete(plane)
    true
  end

  private

  def full?
    @hanger.count >= @capacity
  end

end
