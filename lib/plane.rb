require_relative 'airport'

class Plane
  def land(airport)
    @current_airport = airport if airport.request_landing(self) == :granted
  end

  def takeoff(airport)
    raise 'This plane is not landed there' unless @current_airport == airport
    @current_airport = nil if airport.request_takeoff(self) == :granted
  end

  def flying?
    return false if @current_airport
    true
  end

  private
  
  attr_accessor :current_airport
end
