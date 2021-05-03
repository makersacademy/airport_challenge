require './lib/plane.rb'

class DockingStation
    attr_reader :planes, :capacity, :storm
    DEFAULT_CAPACITY = 20
    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
        @storm = false
    end
    def in_storm
        @storm = true
    end
    if rand(10)>7 
        DockingStation.in_storm
    end
    def release_plane
      fail 'No planes' if empty? 
      fail 'Cannot release plane in storm' if @storm = true
      planes.pop
    end
    def docking_plane(plane, is_broken=false)
      plane.is_broken if is_broken
      fail 'No space in dock' if full?
      @planes << plane
    end
    private
    def full?
      @planes.length >= DEFAULT_CAPACITY
    end
    def empty?
      @planes.empty?
    end
end