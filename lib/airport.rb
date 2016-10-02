require_relative 'plane.rb'

class Airport
attr_reader :planes
attr_accessor :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off
    @planes.pop
  end

  def land(plane)
    raise 'Airport is full' if airport_full?
    @planes << plane
  end


  private
    def airport_full?
      return true if @planes.length >= DEFAULT_CAPACITY
    end

end
