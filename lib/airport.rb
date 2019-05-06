require './lib/plane.rb'

class Airport

  def initialize(capacity)
    @capacity = capacity
    @hanger = []
  end

  def land(plane)
    raise 'Airport Full - Cannot Land' if @hanger.count >= @capacity
    @hanger << plane
  end

  def take_off(plane)
  end

end
