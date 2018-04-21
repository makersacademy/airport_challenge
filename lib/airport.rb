require_relative 'plane.rb'

class Airport

attr_reader :plane

  def take_off
    fail "No planes to take off" unless @plane
    @plane
  end

  def land(plane)
    fail 'Airport is full' if @plane
    @plane = plane
  end

end
