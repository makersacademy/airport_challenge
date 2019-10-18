require_relative 'plane'

class Airport
  
  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 1
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
    
  def land(_plane)
    raise "Airport is full" if full?
    planes << _plane
  end
    
  def take_off(_plane)
    planes.pop
    puts "#{_plane} has taken off" if !@planes.include?(_plane)
  end       
    
  def stormy?
  end
  
  def full?
    planes.count >= capacity
  end
  
end
