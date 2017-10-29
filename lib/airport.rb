require_relative "plane"
require_relative "weather"
class Airport
  def initialize
    @available = []
  end

  def land(plane)
    @available << plane
  end

  def take_off(plane)
      @available.pop
  end

  def stormy?
  end
end



# raise "It's stormy! We can't fly" if stormy?
