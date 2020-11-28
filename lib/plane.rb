require './lib/airport.rb'

class Plane

  attr_reader :current_airport

  def initialize
    @current_airport = nil
  end

  def land_plane(airport)
    fail 'Plane has already landed' if flying? == false

    airport.receive_plane(self)
    @current_airport = airport
  end

  def flying?
    @current_airport.nil?
  end

  def take_off(airport)
    fail 'Plane is already flying' if flying? == true

    fail 'Plane located at different airport' unless airport == @current_airport

    airport.request_take_off(self)
    @current_airport = nil
  end

end
