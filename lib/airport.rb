require_relative 'weather.rb'

class Airport
  attr_reader :plane, :planes

  include Weather

  DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise 'Weather is too dangerous for take off.' if stormy?
    raise 'Airport capacity is full.' if capacity_full?
    @planes << plane
  end

  def take_off(plane)
    raise 'Weather is too dangerous for take off.' if stormy?
    @planes.delete(plane)
  end

  def plane_counter
    :weather
    @planes.count
  end

  def capacity_full?
    plane_counter >= DEFAULT_CAPACITY
  end
end
