require_relative 'airport'

class Plane

  def land(airport)
    if airport.hangar_full?
      raise "Airport hangar at full capacity"
    else
      airport.hangar << self
    end
  end

  def take_off(airport)
    airport.hangar.delete(airport)
    successful_take_off(airport)
  end

  def successful_take_off(airport)
    puts "#{self} has successfully taken-off from #{airport}" # need to figure out how to passe local variable as instance var
  end
end
