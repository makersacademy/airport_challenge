require_relative 'plane.rb'

class Airport

attr_reader :planes

def initialize
  @planes = []
end

  def take_off
    fail "No planes to take off" if @planes.empty?
    @planes.pop
  end

  def land(plane)
    fail 'Airport is full' if @planes.count >= 10
    @planes << plane
  end

end
