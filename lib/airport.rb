require_relative 'plane'

class Airport

  attr_reader :plane, :capacity

  def initialize(capacity = 50)
    @capacity = capacity
    @planes = []
  end

#this instructs partivular plane to land
    def land(plane)
      fail "the airport is full" if full?
      @planes << plane
    end

#this instructs specific plane to take off
    def take_off(plane)
      @planes.delete(plane)
    end


private

def full?
  @planes.length >= @capacity
end


end
