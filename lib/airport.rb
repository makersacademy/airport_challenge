require 'plane'
class Airport
  attr_reader :capacity, :planes, :flying_planes
  DEFAULT_CAPACITY = 10
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @flying_planes = []
  end
  
  def land(plane)
    #raise("This plane already landed somewhere") unless @flying_planes.include?(plane)
    raise("Airport is full") if @planes.size == @capacity
    
    @planes << plane
  end
  
  def takeoff(plane)
    raise("This plane is already flying") if @flying_planes.include?(plane)
    raise("No such plane in this airport") unless @planes.include?(plane)
    @flying_planes << @planes.slice(@planes.index(plane))
    @planes.delete_at(@planes.index(plane))
    "Plane flew away" if @flying_planes.include?(plane)
  end
  
  private
  
  def docked?
  end
  
  def flying?
  end
  
end
