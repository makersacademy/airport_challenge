require_relative 'plane'

class Airport
  attr_reader :plane
  
  def initialize
    @airport = []
  end

  def land(plane)
    fail 'airport is full' if airport_full
    @airport << plane
    land_confirm
  end

  def airport_full
    @airport.count == 1
  end

  def take_off
    fail "No planes available" if airport_empty
    @airport.pop
    take_off_confirm
  end
  
  def airport_empty
    @airport.empty?
  end

  def land_confirm
    puts "Plane landed!"
  end

  def take_off_confirm
    puts "Plane taken off! No longer at airport."
  end

end
