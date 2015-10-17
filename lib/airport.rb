require_relative 'plane'
require_relative 'weather'

class Airport

  include Weather

attr_accessor :land
attr_accessor :takeoff
attr_accessor :capacity
attr_accessor :planes

  def initialize(capacity=2)
    @capacity = capacity
    @planes =[]
  end

  def land(plane)
    fail 'the weather is too stormy' if self.stormy == true
    fail 'the airport is full' if full?
    fail 'already in airport' if (plane.flying == false)
    plane.airport_location(self.object_id)
    plane.flying?(false)
    @planes << plane

  end

  def takeoff(plane)
    fail 'the weather is too stormy' if self.stormy == true
    fail 'Plane not at this airport' if (plane.airport != self.object_id)
    fail 'Plane is already flying' if (plane.flying == true)
    plane.airport = nil
    plane.flying?(true)
    planes.delete(plane)


    true
  end

  # def full?(capacity)
  #   @capacity = capacity
  # end


    def full?
      @planes.count > @capacity ? true : false
    end


end
