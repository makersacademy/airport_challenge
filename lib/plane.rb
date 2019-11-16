require 'errors'

class Plane
  attr_accessor :airborne, :accounted_for
  
  def initialize
    @airborne = false
    @accounted_for = false
  end

  def take_off
    raise Errors::CURRENTLY_AIRBORNE if @airborne 

    puts "plane has taken off"
    @airborne = true
  end

  def land
    raise Errors::CURRENTLY_GROUNDED unless @airborne || !@accounted_for

    puts "plane has landed"
    @airborne = false
    @accounted_for = true
  end
end
