class Plane

  attr_reader :current_airport

  def initialize
    @current_airport = nil
  end

  def update_airport(airport = nil)
    fail fail_message_sna if invalid_airport(airport)
    @current_airport = airport
  end

  private

  def invalid_airport(airport)
    (airport.class != Airport) && (airport != nil)
  end

  def fail_message_sna
    'Call error: must include an Airport as an argument'
  end

end
