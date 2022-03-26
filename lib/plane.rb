require_relative './airport'

class Plane
  def land(airport)
    raise "#{airport} is full" if airport.hangar.length == airport.capacity
    airport.hangar.push(self)
  end

  def take_off(airport)
    raise "#{self} is not currently at #{airport}" unless airport.hangar.include?(self)
    puts "#{self} has left #{airport}"
    airport.hangar.delete(self)
  end
end
