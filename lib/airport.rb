require_relative "plane"

class Airport
  attr_accessor :hangar , :hangar_capacity

  def initialize(hangar_capacity = 20)
    @hangar = []
    @hangar_capacity = hangar_capacity
  end  

  def land (plane)
    fail "Cannot land, Airport is full" if full?
    @hangar.push(plane)
  end

  def take_off
    @hangar.pop
  end
  
  def in_airport?(plane)
    @hangar.include? plane
  end  

  def full?
    @hangar.length == @hangar_capacity
  end  
end  