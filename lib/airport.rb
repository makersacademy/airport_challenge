
class Airport
  attr_reader :terminal

  def initialize
    @terminal = []
  end

  def land(plane)
    @terminal << plane
  end
end
