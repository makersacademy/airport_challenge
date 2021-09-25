class Plane
  attr_reader :current_airport
  def initialize(current_airport = 0)
    @current_airport = current_airport
  end
end