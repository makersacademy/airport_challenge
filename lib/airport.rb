require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather
  attr_accessor :capacity
  CAPACITY = 5
  
  def initialize
    @planes = Array.new
    @capacity = CAPACITY
    @weather = Weather.new
  end

  def land(plane)
    fail "plane already at airport" if @planes.include?(plane)
    fail "Too stormy" if @weather.stormy?
    fail "The airport is full" if full?

    @planes << plane
  end

  def take_off(plane)
    fail "Too stormy" if @weather.stormy?
    fail "no planes to take off " unless @planes.any?
      
    @planes.delete(plane)
    "The plane has taken off"
  end

  private
  def full?
    @planes.count >= @capacity
  end

end
