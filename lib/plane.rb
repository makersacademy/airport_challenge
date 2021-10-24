class Plane

  attr_reader :current_airport

  def initialize
    @current_airport = nil
  end

  def update_airport(airport = nil)
    fail fail_message_sna if invalid_airport(airport)
    @current_airport = airport
  end

  def land_at_airport(airport)
    fail fail_message_rnp if not_airport?(airport)
    @current_airport.nil? ? airport.request_land(self) : landing_error
  end

  def launch_from_airport(airport)
    fail fail_message_rnp if not_airport?(airport)
    @current_airport == airport ? airport.request_launch(self) : launching_error
  end

  def confirm_flying
    @current_airport.nil? ? flying_confirmed : not_flying_confirmed
  end

  private

  def invalid_airport(airport)
    not_airport?(airport) && !airport.nil?
  end

  def not_airport?(airport)
    airport.class != Airport
  end

  def flying_confirmed
    puts "Confirmed: plane is in flight."
    true
  end

  def not_flying_confirmed
    puts "Warning: plane is NOT in flight."
    false
  end

  def landing_error
    fail 'Cannot land: plane is already in an airport'
  end

  def launching_error
    fail 'Cannot launch: plane is not in this airport'
  end

  def fail_message_sna
    'Call error: must include an Airport as an argument'
  end

  def fail_message_rnp
    'Call error: must include a Plane as an argument'
  end

end
