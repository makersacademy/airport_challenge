require './lib/airport.rb'

class Plane

  attr_reader :current_airport

  def initialize
    @current_airport = nil
  end

  def land_plane(airport)
    fail 'Plane has already landed' if flying? == false

    @current_airport = airport
  end

  def flying?
    @current_airport.nil?
  end

  def take_off(airport)
  end

end
