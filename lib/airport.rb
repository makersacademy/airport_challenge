require_relative 'plane'

class Airport 
  DEFAULTCAPACITY = 20
  attr_reader :planes

  def initialize(capacity = DEFAULTCAPACITY)
    @capacity = capacity
    @planes = []

  end 

  def land(plane)
    fail 'Unable to land, the airport is full' if full?
    fail 'This plane has already landed in another airport' if landed?(plane)
    fail 'It is too stormy to take off' if stormy?
    plane.landed = true
    @planes << plane 

  end 

  def take_off(plane)
    fail 'There are no planes in the airport' if empty?
    fail 'This plane is not in this airport' unless present?(plane)
    fail 'It is too stormy to take off' if stormy?
    plane.landed = false
    @planes.delete(plane)
    "The plane has left the airport"
  end 

  private 

  def landed?(plane)
    plane.landed
  end 

  def full?
    @planes.count >= @capacity
  end 

  def stormy?
    x = rand(1..100)
    return true if x == 13
  end 

  def empty?
    @planes.count.zero?
  end 

  def present?(plane)
    return true if planes.include?(plane)
  end 

end
