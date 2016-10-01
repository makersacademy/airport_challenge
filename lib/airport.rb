require_relative 'plane.rb'

class Airport

    DEFAULT_CAPACITY = 10

    attr_reader :planes, :capacity

    def  initialize(capacity=DEFAULT_CAPACITY)
      @planes = []
      @capacity = capacity
    end

    def land(plane)
      fail "Airport is full." if @planes.length >= DEFAULT_CAPACITY
      @planes << plane
      end

    def take_off
      fail "Airport is empty" if @planes.length == 0
      @planes.pop
    end

end
