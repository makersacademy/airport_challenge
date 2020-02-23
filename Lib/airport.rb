require_relative "./plane.rb"

class Airport
  attr_reader(:capacity, :hangar)
  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end 

  def land(plane)
    raise "Plane cannot land: airport full" if @hangar.count >= @capacity
    @hangar.push(plane)
  end

  def take_off(plane)
    
    @hangar.delete(plane)
  end
end


