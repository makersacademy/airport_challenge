require_relative 'plane'

class Airport
  
  attr_reader :hanger, :capacity
  
  CAPACITY = 20

  def initialize(capacity=CAPACITY)
    @hanger = []
    @capacity = capacity
  end
  
  def land(plane)
    raise "airport full" if full?
    raise "It's too stormy to land" if stormy?
    @hanger << plane
  end

  def takeoff
    raise "It's too stormy to take off" if stormy?
    @hanger.pop && (puts "A plane has left the airport\n")
  end


  private

  def full?
    @hanger.length >= @capacity
  end

  def stormy?
    rand(0..100) > 90
  end
  
end