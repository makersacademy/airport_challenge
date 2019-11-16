require 'errors'

class Plane
  attr_accessor :airborne
  
  def initialize
    @airborne = false
  end

  def take_off
    raise Errors::CURRENTLY_AIRBORNE if @airborne

    puts "plane has taken off"
    @airborne = true
  end

  def land
    raise Errors::CURRENTLY_GROUNDED unless @airborne

    puts "plane has landed"
    @airborne = false
  end
end
