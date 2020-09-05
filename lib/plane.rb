require_relative "airport"

class Plane
  def initialize
    @current_airport = nil
  end

  def land(airport)
    fail "This plane is already landed" if landed?
    airport.request_landing(self)
    @current_airport = airport
  end

  def take_off
    fail "This plane is already in the air" if flying?
    @current_airport.request_take_off(self)
    @current_airport = nil
    puts "The plane has departed"
  end

  private

  def landed?
    @current_airport != nil
  end

  def flying?
    @current_airport == nil
  end
end
