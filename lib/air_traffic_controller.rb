require_relative 'airport'
require_relative 'weather'

class AirTrafficController

  def instruct_landing(airport, plane, weather)
    if weather.stormy?
      raise "Not safe to land when there is a storm!"
    elsif airport.full
      raise "Airport is at full capacity, cannot land plane"
    else
      airport.accept(plane)
    end
  end

  def instruct_takeoff(airport, plane, weather)
    if weather.stormy?
      raise "Not safe to take off when there is a storm!"
    else
      airport.release(plane)
    end
  end
end
