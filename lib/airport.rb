require_relative './plane.rb'
require_relative './weather.rb'

class Airport
  attr_reader :capacity, :weather
  AIRPORT_CAPACITY = 20
  def initialize(capacity = AIRPORT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "airport is full" if full?
    fail "can't land weather is stormy" if weather.stormy?
    @planes << plane
  end

  def take_off
    fail 'no planes available' if empty?
    fail "can't take off if wheather stormy" if weather.stormy?
    @planes.pop
  end

  private
  attr_reader :planes

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end
