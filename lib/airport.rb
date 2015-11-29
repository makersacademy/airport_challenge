require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

attr_reader :planes
attr_reader :capacity

  def land(plane)
    fail 'Airport is full' if full?
     planes << plane
  end

  def take_off(plane)
    fail 'Airport is empty' if empty?
    planes.pop
  end


private

 def full?
   planes.length >= capacity
 end

 def empty?
   planes.empty?
 end



end
