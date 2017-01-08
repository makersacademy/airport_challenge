
require_relative 'plane'


class Airport
  attr_reader :capacity



  DEFAULT_CAPACITY = 12


    def initialize(capacity=DEFAULT_CAPACITY)
      @capacity = DEFAULT_CAPACITY
      @planes = []
    end

    def land(plane)
      fail "Sorry cannot land, airport is full" if full?
      fail "You cannot land due to bad weather" if stormy?
      planes << plane
    end

    def take_off(plane)
      fail 'You cannot take off due to bad weather' if stormy?
      planes.pop
    end

    def full?
      planes.count >= capacity
    end

private

attr_reader :planes
    def stormy?
      rand(0..5) == 2
    end
end
