require_relative 'plane_class'
require_relative 'weather_class'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader   :hangars
  attr_accessor :weather
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @hangars = []
    @weather = weather
  end

  def full?
    @hangars.count == @capacity ? true : false
  end

  def land(plane)
    raise "The Airport is full, the plane can't land" if full?
    raise "The weather is stormy, the plane can't land." if @weather.stormy?
    @hangars << plane
  end

  def take_off(plane_hangar)
    raise "The weater is stormy, the plane can't depart." if @weather.stormy?
    @hangars.delete_at(plane_hangar)
  end

end
