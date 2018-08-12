class Plane

  attr_reader :current_airport, :flying

  def initialize
    # When initialized assume plane is flying
    @flying = true
  end

  def landing(airport)
    check_already_landed
    change_state(airport)
  end

  def taking_off(airport)
    check_take_off_edge_cases(airport)
    change_state(nil) # Nil because plane no longer in airport
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
