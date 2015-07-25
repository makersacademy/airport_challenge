require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 5
  
  attr_accessor :capacity 
  
  def initialize(capacity= DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off plane
    raise "There are no planes at #{self.class.name}" if empty?
    @planes.delete (plane)
    plane.take_off
  end
  
  def land plane
    raise "#{self.class.name} is full" if full?
    @planes << plane
    plane.land
  end
  
  private
  
  attr_accessor :planes
  
  def full?
    planes.count >= capacity
  end
  
  def empty?
    planes.count == 0
  end   
  
end

