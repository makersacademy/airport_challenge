class Plane
  attr_reader :current_airport
  def initialize(plane_id)
    @plane_id = plane_id
    @current_airport = 0
  end
  
  def update_airport(airport_id)
    @current_airport = airport_id
  end
end
