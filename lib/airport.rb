require './lib/plane'
class Airport
  attr_reader :capacity, :planes, :plane
  DEFAULT_CAPACITY = 10
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end
  
  def create_plane(plane)
    raise("Airport is full") if @planes.size >= @capacity
    
    $flying_planes.delete_at($flying_planes.index(plane))
    @plane = plane
    @planes << @plane
    return @plane
  end
  
  def land(plane)
    raise("Airport is full") if @planes.size >= @capacity
    raise("Plane is already at airport") unless $flying_planes.include?(plane)
    
    @planes << $flying_planes.slice($flying_planes.index(plane))
    $flying_planes.delete_at($flying_planes.index(plane))
  end
  
  def takeoff(plane)
    raise("This plane is already flying") if $flying_planes.include?(plane)
    raise("No such plane in this airport") unless @planes.include?(plane)
    
    $flying_planes << @planes.slice(@planes.index(plane))
    @planes.delete_at(@planes.index(plane))
    "Plane flew away" if $flying_planes.include?(plane)
  end
  
  private
  
  def docked?
  end
  
  def flying?
  end
  
end
