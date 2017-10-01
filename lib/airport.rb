require_relative 'aeroplane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :weather, :capacity, :planes

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail 'Plane cannot land due to storm!' if stormy_weather
    fail 'Airport full!' if full?
    fail 'This plane has already landed!' if plane_landed(plane)
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail 'Plane cannot take off due to storm!' if stormy_weather
    fail 'Airport empty!' if empty?
    fail 'This plane is on flight!' unless plane_landed(plane)
    plane.fly
    @planes.delete(plane)
  end

  private
  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

  def plane_landed(plane)
    @planes.include? plane
  end

  def stormy_weather
    @weather.stormy?
  end

end
