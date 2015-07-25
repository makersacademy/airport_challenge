require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 50
  
  attr_accessor :capacity 
  
  def initialize(capacity= DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off
    planes.each_index do |aircraft| 
      if planes[aircraft].landed
        return planes.slice!(aircraft)
      end
    end
    fail 'No planes at airport' 
  end
  
  def land plane
    fail 'Airport full' if full?
    planes << plane
  end
  
  private
  
  attr_accessor :planes
  
  def full?
    planes.count >= capacity
  end
  
  def empty?
    planes.empty?
  end   
  
end

