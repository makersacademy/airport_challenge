require_relative 'planes'

class Airport

attr_reader :apron

  def initialize
    @apron = []
  end

  def land(plane)
    apron << plane
  end

  def take_off(plane)
    apron.pop
  end

  def planes_at_airport
    apron
  end

end
