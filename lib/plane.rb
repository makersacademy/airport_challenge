require_relative 'airport'
require_relative 'weather'

class Plane
  attr_accessor :status

  def initialize
    @status = "flying"
  end

  def land(airport)
    unless weather_not_safe! || airport.full! || plane_landed!
      airport.planes << self
      @status = "landed"
    end
  end

  def take_off(airport)
    weather_not_safe! || flying! || not_in_airport!(airport)
       airport::planes.delete(self)
       @status = "flying"
    # end
  end

  private

  def weather_not_safe!
    Weather.stormy? ? (raise "Unable to fly as weather is stormy") : false
  end

  def flying!
    @status == "flying" ? (raise "The plane is currently flying") : false
  end

  def plane_landed!
    @status == "landed" ?  (raise "The plane has already landed") : false
  end

  def not_in_airport!(airport)
    airport.planes.include?(self) ?  false : (raise "#{self} isn't in #{airport}")
  end

end
