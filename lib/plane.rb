class Plane
  attr_accessor :current_airport
  def initialize
    @current_airport = nil
  end

  def in_flight?
    !@current_airport.nil?
  end
end
