class Plane

  attr_reader :current_airport

  def initialize
    @current_airport
  end

  def park_in_airport(airport)
    @current_airport = airport
  end

end
