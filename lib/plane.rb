class Plane
  attr_accessor :current_airport
  def initialize(plane_id)
    @plane_id = plane_id
    @current_airport = nil
  end

  def in_flight?
    !@current_airport.nil?
  end
end
