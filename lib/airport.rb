require_relative 'weather'
require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 2

  attr_reader :planes, :weather, :capacity

  def initialize(capacity: DEFAULT_CAPACITY, weather: Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail 'Landing not permited due to poor weather conditions' if weather.stormy?
    fail 'This plane has already landed' if @planes.include?(plane)
    fail 'This airport is full' if full?
    plane.landed
    @planes.push(plane)
  end

  def take_off(plane)
    fail 'Take off not permited due to poor weather conditions' if weather.stormy?
    fail 'This plane has not landed yet' unless @planes.include?(plane)
    plane.taken_off
    @planes.delete(plane)
  end

  def full?
    planes.count >= capacity
  end

end
