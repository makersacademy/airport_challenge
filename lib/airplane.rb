#Assume planes that are made aren't at the airport and are in flight at first

class Airplane
  attr_accessor :planes_at_airport, :flying
  @@planes_at_airport = []

  def initialize()
    @flying = true
  end

  def flying?
    return @flying
  end

  def self.planes_at_airport
    @@planes_at_airport
  end
end
