require_relative "./plane.rb"

class Airport
  attr_reader(:capacity, :hangar)
  
  def initialize
    @capacity = 10
    @hangar = []
  end 

  def land(plane)
    @hangar.push(plane)
  end

  def take_off(plane)
    "No longer in the airport"
  end
end