class Plane
  attr_accessor :flight_status

  def initialize
    #fail "Plane number not given!" unless plane_number.is_a? Integer
    @flight_status = false
  end
end
