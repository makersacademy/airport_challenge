require 'airport'

class Plane

  attr_reader :airborne

  def initialize
    @airborne = true
  end

  def land(airport)
    return raise "Plane already on the ground" if @airborne == false
    airport.hangar.push(self)
    @airborne = false
  end

  def take_off(airport)
    return raise "Plane already airborne" if @airborne == true
    airport.hangar.delete(self)
    @airborne = true
    puts "Flying free!"
  end
end
