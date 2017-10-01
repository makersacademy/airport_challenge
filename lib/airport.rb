require_relative 'aeroplane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY=10

  attr_reader :weather, :capacity, :planes

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full!' if full?
    fail 'This plane has already landed!' if @planes.include? plane
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail 'Plane cannot take off due to storm' if @weather.stormy?
    fail 'Airport empty!' if empty?
    fail 'This plane is on flight!' unless @planes.include? plane
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

end
