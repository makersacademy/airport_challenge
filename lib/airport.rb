require_relative 'weather'
require_relative 'plane'

class Airport
  attr_reader :airport_capacity, :flying, :planes
  MAXIMUM_CAPACITY = 30
  DEFAULT_CAPACITY = 20
  include Weather

  def initialize
    @airport_capacity ||= DEFAULT_CAPACITY
    @planes ||= []
  end

  def flying?
    if @flying == true
      return 'plane is flying'
    else
      return 'plane landed'
    end
  end

  def land(plane)
    raise 'plane cannot land' if @stormy
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise 'plane cannot take off' if @stormy
    plane.take_off
    @planes << plane
    @planes.delete plane
  end

  def full?
    if planes.count >= MAXIMUM_CAPACITY
      return 'true'
    else
      return 'false'
    end
  end
end
