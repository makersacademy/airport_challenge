require_relative "./plane.rb"

class Airport
  attr_reader :capacity
  attr_accessor :weather
  def initialize
    @capacity = []
    @weather = "good"
  end
  def take_off?
    if @weather == "good"
      @capacity.pop
      return true
    end
    return false
  end
  def land(plane)
    @capacity << plane
  end
end
