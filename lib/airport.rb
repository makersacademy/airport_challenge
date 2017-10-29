require_relative "plane"
require_relative "weather"
class Airport

  attr_reader :weather

  def initialize
    @available = []
  end

  def land(plane)
    raise "It's stormy! You can't land right now" if stormy?
    @available << plane
  end

  def take_off(plane)
      raise "It's stormy! We can't fly" if stormy?
      @available.pop
  end

  def stormy?
     Weather::report
  end
end



# raise "It's stormy! We can't fly" if stormy?
