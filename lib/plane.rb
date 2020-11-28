require './lib/airport.rb'

class Plane

  attr_reader :current_airport

  def initialize
    @current_airport = nil
  end

  def land_plane(airport)
    @current_airport = airport
  end

  def flying?
    @current_airport.nil?
  end

end
