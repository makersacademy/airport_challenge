require_relative 'weather'
require_relative 'plane'

class Airport

  attr_reader :capacity
  attr_accessor :planes

  def initialize(capacity = 5)
    @planes = []
    @capacity = capacity
    @weather = Weather.new.now?
  end

  def land(plane)
    raise "Landing not possible, airport is full" if full_capacity?
    raise "Stormy weather: not possible to land" if weather_stormy?
    raise "Plane is already at the airport" if @planes.include? plane
    @planes << plane
  end

  def take_off(plane)
    raise "Stormy weather: not possible to take off" if weather_stormy?
    raise "Plane is not at the airport" unless @planes.include? plane
    @planes.delete(plane)
  end

  def weather_stormy?
    @weather == :stormy
  end

  def full_capacity?
    @planes.count >= @capacity
  end

end
