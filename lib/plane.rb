# require_relative 'airport.rb'

class Plane
  def initialize
    @status = { flying: true, location: "The Sky!" }
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

  def land(airport)
    adjust_status(false, airport)
  end

  def take_off
    adjust_status(true, "The Sky!")
  end
end
