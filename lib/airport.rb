require_relative 'plane'
require_relative 'weather'
class Airport
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = Array.new
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Cannot land the plane because weather is stormy" if weather.stormy?
    fail "This plane has already landed" if planes.include? plane
    fail "No spaces are available for landing" if full?
    
    planes << plane
  end

  def take_off(plane)
    fail "The plane cannot take off because weather is stormy" if weather.stormy?
    fail "There are no planes to take off" if empty?
    fail "This plane is not currently at the airport" unless planes.include? plane

    planes.delete(plane) if planes.include?(plane)
    "Plane took off"
  end

  private
  def full?
    planes.length >= capacity
  end
  
  def empty?
    planes.length < 1
  end
end
