require_relative 'airport'

class Plane

  def land(airport)
    airport.hangar << self
  end

  def take_off(airport)
    airport.hangar.delete(airport)
    successful_take_off(airport)
  end

  def successful_take_off(airport)
    puts "#{self} has successfully taken-off from #{airport}"
  end
end
