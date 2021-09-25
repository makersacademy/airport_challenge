class Plane
  attr_reader :current_airport
  def initialize(plane_id, current_airport = 0)
    @plane_id = plane_id
    @current_airport = current_airport
  end
end
