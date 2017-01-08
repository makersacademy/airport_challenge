require_relative 'airport.rb'

class Plane
  attr_accessor :landed


=begin
  def take_off(airport)
    departed = true
    landed = false
  end
=end


  def land(airport)
    @landed = true
    #departed = false
    airport.land(self)
  end
end
