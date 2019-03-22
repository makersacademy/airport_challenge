require_relative "./weather.rb"
require_relative "./airport.rb"

class Plane
  FLYING_STATUS = "flying"
  attr_reader :airport

  def initialize(airport = FLYING_STATUS)
    @airport = airport
  end

  def land(airport)
    fail "Unable to land" if Weather.stormy? || airport.full?
    
    @airport = airport
    airport.planes << self
  end

  def take_off(airport)
    fail "Alredy flying" if @airport == FLYING_STATUS
    fail "Not in such airport" unless airport == @airport
    fail "Unable to take off" if Weather.stormy?

    @airport = FLYING_STATUS
    "Taking off"
  end

#  def everything_fine?
#    !(Weather.stormy? && airport.full?)
#  end
end
