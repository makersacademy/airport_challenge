require_relative "plane"
class Airport
  def initialize
    @available = []
  end

  def land(plane)
    @available << plane
    true
  end

  def take_off(plane)
      @available.pop
      true
  end
end
