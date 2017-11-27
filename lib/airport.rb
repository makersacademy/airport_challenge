require_relative "plane"
require_relative "weather"

class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :airport, :weather
  attr_accessor :capacity

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @airport = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "There are no flying planes" if plane.flying? == false
    raise "The airport capacity is full" if full?
    raise "Cannot land the plane in stormy weather" if stormy?
    plane.state = false
    @airport << plane
  end

  def take_off
    raise "There are no planes available" if empty?
    raise "The plane cannot take off as weather is stormy" if stormy?
    plane = @airport.pop
    plane.state = true
    "The plane #{plane} has left the airport"
  end

  private

  def empty?
    @airport.empty?
  end

  def stormy?
    @weather.stormy? == true
  end

  def full?
    @airport.count >= DEFAULT_CAPACITY
  end
end
