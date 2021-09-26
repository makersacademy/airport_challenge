
class Landing_planes
  attr_reader :landed_planes
  attr_reader :airport
  

  def initialize(capacity)
    @capacity = capacity
    @flying_plane = []
    @landed_planes = []
  end

  def landed_planes(flying_plane, landed_planes)
    @landed_planes = landed_planes
    flying_plane.each do |plane|
      while @landed_planes.length < self.maximum do @landed_planes.push(plane)
      end
    end
    flying_plane.each { |item| flying_plane.delete(item) }
    @landed_planes
  end
  
  def maximum
    @capacity
  end
end
    