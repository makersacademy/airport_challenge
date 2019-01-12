class Plane
  attr_reader :plane_number

  def initialize(plane_number)
    fail "Plane number not given!" unless plane_number.is_a? Integer 
    @plane_number = plane_number
  end
end
