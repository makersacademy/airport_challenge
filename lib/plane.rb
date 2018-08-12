class Plane

  attr_reader :current_airport, :flying

  def initialize
    # When instantiated assume plane is flying and not in an airport
    @flying = true
    @current_airport = nil
  end

  def land(airport)
    check_already_landed # Method to handle edge case
    airport.put_in_airport(self)
    change_state(airport)
  end

  def take_off(airport)
    check_take_off_edge_cases(airport) # Method to handle edge cases
    airport.take_from_airport(self)
    change_state(nil) # Nil because no longer in airport
  end

  def check_already_landed
    message = "Plane that has already landed cannot land again"
    raise message unless @flying
  end

  def check_take_off_edge_cases(airport)
    check_if_already_flying
    check_if_in_airport_requested(airport)
  end

  def check_if_already_flying
    raise "Flying plane cannot take off" if @flying
  end

  def check_if_in_airport_requested(airport)
    message = "Plane can only take off from airport it is in"
    raise message unless airport == @current_airport
  end

  def change_state(airport)
    @current_airport = airport
    @flying = !@flying
  end

end
