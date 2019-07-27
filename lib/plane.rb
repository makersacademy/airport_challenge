class Plane

  attr_reader :current_airport, :flying_status

  def initialize(airport)
    @current_airport = airport
    @flying_status = false
  end

  def land(airport)
    @flying_status = false
    @current_airport = airport
  end

  def take_off(airport)
    @flying_status = true
    @current_airport = nil
  end

  def flying?
    @flying_status
  end

end