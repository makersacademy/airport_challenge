require_relative 'plane'

class Airport

  attr_accessor :plane, :capacity, :flying

  def initialize(capacity = 50)
    @capacity = capacity
    @planes = []
  end

#this instructs particular plane to land
    def land(plane)
      fail "the airport is full" if full?
      fail "plane is already grounded" if plane.flying == false
      @planes << plane
    end

#this instructs specific plane to take off
    def take_off(plane)
  #    fail "plane is already flying" if @flying == true
      @planes.delete(plane)
    end


private

def full?
  @planes.length >= @capacity
end


end
