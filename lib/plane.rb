require_relative './airport'

class Plane
  attr_accessor :state

  def initialize
    puts "#{self} has been made and has taken off"
    @state = "Flying"
  end

  def land(airport)
    raise "#{self} is already landed" if @state == "Landed"
    raise "#{self} cannot land, the weather is stormy" if airport.weather == "Stormy"
    raise "#{airport} is full" if airport.hangar.length == airport.capacity
    puts "#{self} has landed at #{airport}"
    self.state = "Landed"
    airport.hangar.push(self)
  end

  def take_off(airport)
    raise "#{self} is already flying" if @state == "Flying"
    raise "#{self} cannot take off, the weather is stormy" if airport.weather == "Stormy"
    raise "#{self} is not currently at #{airport}" unless airport.hangar.include?(self)
    puts "#{self} has left #{airport}"
    self.state = "Flying"
    airport.hangar.delete(self)
  end
end
