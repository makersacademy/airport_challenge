class Plane

  attr_reader :current_airport

  def initialize
    @flying = true
    @current_airport = nil
  end

  def land(airport)
    raise "Plane that has already landed cannot land again" unless @flying
    airport.put_in_airport(self)
    @current_airport = airport
    @flying = false
  end

  def take_off(airport)
    raise "Flying plane cannot take off" if @flying
    message = "Plane can only take off from airport it is in"
    raise message unless airport == @current_airport
    airport.take_from_airport(self)
    @current_airport = nil
    @flying = true
  end

end
