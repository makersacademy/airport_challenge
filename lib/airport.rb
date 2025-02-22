require_relative 'plane'

class Airport
  attr_accessor :landed
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @landed = []
  end

  def create_plane
    Plane.new
  end

  def land(plane)
    fail 'Airport is full' if full?
    @landed << plane
  end
  
  def landed?(plane)
    if @landed.include? plane
      true
    else false
    end
  end

  def take_off(plane)
    @landed.delete(plane)
  end

  private
  
  def full?
    landed.count >= capacity
  end
end
