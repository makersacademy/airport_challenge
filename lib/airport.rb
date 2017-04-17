require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes
  attr_reader :capacity
  attr_reader :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport is full' if full?
    raise 'planes are not allowed to land in stormy weather' if stormy?
     planes << plane
  end

  def take_off(plane)
    raise 'Airport is empty' if empty?
    raise 'Planes are not allowed to take off in stormy weather' if stormy?
    planes.pop
  end


private

   def stormy?
     rand(1..6)>4
   end

   def full?
     planes.length >= capacity
   end

   def empty?
     planes.empty?
   end



end
