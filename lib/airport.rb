require_relative 'plane'
class Airport
  
 attr_reader :capacity, :planes

  DEAFAULT_CAPACITY = 50

  def initialize(capacity = DEAFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land_plane(plane)
    fail 'Airport is full' if full?
    planes << plane
  end

  def take_off(plane)
    fail 'There are no planes in the aiport' if empty?
    planes.delete(plane)
  end

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end
end
