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
    clear_for_take_off(airport)
    @flying_status = true
    @current_airport = nil
  end

  def flying?
    @flying_status
  end

  private

  def clear_for_take_off(airport)
    raise "Take off from wrong airport, abort." if airport != @current_airport
  end

end
