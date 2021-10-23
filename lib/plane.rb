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
    airport.request_land(self)
  end

  def launch_from_airport(airport)
    fail fail_message_rnp if not_airport?(airport)
    airport.request_launch(self)
  end

  private

  def invalid_airport(airport)
    not_airport?(airport) && (airport != nil)
  end

  def not_airport?(airport)
    airport.class != Airport
  end

  def fail_message_sna
    'Call error: must include an Airport as an argument'
  end

end
