require_relative './plane.rb'

class Airport
  attr_reader :hangar

  def land(plane)
    fail "Airport full" if @hangar
    
    @hangar = plane
  end

  def take_off(*)
    @hangar = nil
    puts "Plane has left airport"
  end
end
