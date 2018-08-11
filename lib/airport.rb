require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :parked_planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @weather_condition = set_weather
    @capacity = capacity
    @parked_planes = []
  end

  def set_weather
    (0..2).include?(rand(10)) ? :stormy : :sunny 
  end

  def full?
    @parked_planes.count == capacity
  end

  def land(plane)
    raise 'Airport is full' if full?
    raise 'Unable to land due to storm' if @weather_condition == :stormy
    @parked_planes << plane
  end

  def take_off(plane)
    raise 'No planes in airport' if @parked_planes.empty?
    raise 'Unable to take off due to storm' if @weather_condition == :stormy
    @parked_planes.delete(plane)
  end
end

