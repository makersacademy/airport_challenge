class Plane
  
  attr_accessor :plane_attributes
  
  def initialize(plane_id, airport_id = "IN TRANSIT/AIR")
    @plane_attributes = {
      plane_id: plane_id,
      airport_id: airport_id
    } 
  end

  def check_location
    @plane_attributes[:airport_id]
  end
end
