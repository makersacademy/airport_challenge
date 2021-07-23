require_relative "plane"

class Airport
  attr_accessor :hangar

  def initialize
    @hangar = []
  end  

  def land (plane)
    @hangar.push(plane)
  end

  def take_off
    @hangar.pop
  end
  
  def in_airport?(plane)
    @hangar.include? plane
  end  
end  