class Airport
  attr_reader :hanger
  def initialize
    @hanger = []
  end

  def take_off(plane)
    @hanger -= [plane]
  end
end
