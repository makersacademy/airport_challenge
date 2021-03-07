# require_relative 'airport.rb'

class Plane
  def initialize
    @status = { flying: true, location: "The Sky!"}
  end

  attr_reader :status

  def land(airport)
    if self.status[:flying] == false
      "Plane has already landed at an airport: #{self.status[:location].name}"
    else
      adjust_status(false, airport)
    end
  end

  def take_off
    if self.status[:flying] == true
      "Plane is already flying."
    else
      adjust_status(true, "The Sky!")
    end
  end

private
  def adjust_status(flying, location)
    @status = {flying: flying, location: location}
  end
end
