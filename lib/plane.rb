# require_relative 'airport.rb'

class Plane
  def initialize
    @status = { flying: true, location: "The Sky!" }
  end

  def land(airport)
    if !flying?
      "Plane has already landed at an airport: #{location.name}"
    else
      adjust_status(false, airport)
    end
  end

  def take_off
    if flying?
      "Plane is already flying."
    else
      adjust_status(true, "The Sky!")
    end
  end

  def location
    @status[:location]
  end

  def flying?
    @status[:flying]
  end

private
  def adjust_status(flying, location)
    @status = { flying: flying, location: location }
  end
end
