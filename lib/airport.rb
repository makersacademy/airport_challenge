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
    @hanger << plane
  end

  def takeoff
    @hanger.pop && (puts "A plane has left the airport\n")
  end


  private
  
  def full?
    @hanger.length >= @capacity ? true : false
  end

  
end