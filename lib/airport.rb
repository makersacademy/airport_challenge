require_relative 'plane'
require_relative 'weather'

class Airport
  AIRPORT_CAPACITY = 11

  attr_reader :capacity, :planes

  def initialize(capacity = AIRPORT_CAPACITY)
    @capacity = capacity
    @planes = Array.new(capacity, Plane.new)
    @forecast = Weather.new
  end


  def land(plane)
    # if plane_landed? == true
    fail "The airport is full" if airport_full?
    puts "The plane has landed."
    @planes << Plane.new
    p @planes.count
  # end
  end

  def take_off(plane)
    fail "Weather is too stormy to take off" if Weather.stormy? == true
    @planes.pop
    p @planes.count
    puts "There are now #{@planes.count} planes in the airport"
  end

  def airport_full?
    planes.count >= capacity
  end

end
