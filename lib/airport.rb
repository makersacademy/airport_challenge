require_relative 'plane.rb'

class Airport
attr_reader :planes
attr_accessor :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full' if airport_full?
    @planes << plane
  end

  def take_off
    raise 'No planes available for take off' if no_planes?
    @planes.pop
  end

  private
    def airport_full?
      return true if @planes.length >= DEFAULT_CAPACITY
    end

    def no_planes?
      return true if @planes.length == 0
    end

end
