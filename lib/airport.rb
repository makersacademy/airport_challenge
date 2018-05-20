require_relative 'plane'

class Airport

  attr_reader :weather

  def initialize
    @weather = ["sunny", 'stormy'].sample
  end

  # def weather
  #   ["sunny", 'stormy'].sample
  # end

  def land(plane)
    "The following plane: #{plane} has landed"
  end

  def take_off(plane)
    fail "Unsafe weather. Due to the storm #{plane} can not take off" if stormy?
    "The following plane: #{plane} has taken off"
  end

  private

  def stormy?
    @weather == "stormy"
  end

  # def sunny?
  #   @weather == "sunny"
  # end

end
