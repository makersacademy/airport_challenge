require 'errors'

class Plane
  attr_accessor :airborne, :accounted_for
  
  def initialize
    @airborne = false
    @accounted_for = false
  end

  def take_off
    raise Errors::NO_AIRPORT unless accounted_for
    raise Errors::CURRENTLY_AIRBORNE if airborne 

    @airborne = true
    'plane has taken off'
  end

  def land
    raise Errors::CURRENTLY_GROUNDED unless airborne or !accounted_for

    @airborne = false
    @accounted_for = true
    'plane has landed'
  end
end
