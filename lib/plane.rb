class Plane

  attr_reader :current_airport, :flying_status

  def initialize(airport)
    @current_airport = airport
    @flying_status = false
  end

  def land(airport)
    @current_airport = airport
    @flying_status = false
  end

  def take_off(airport)
    raise "Attempting take-off from wrong airport. Aborting procedure." if airport != @current_airport
    @flying_status = true
    @current_airport = nil
  end

  def flying?
    @flying_status
  end

end