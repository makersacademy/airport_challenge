
class Airport
  attr_reader :terminal

  def initialize
    @terminal = []
  end

  def land(plane)
    @terminal << plane
  end

  def take_off(plane)

  end
end
