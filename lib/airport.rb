class Airport
  attr_reader :hanger
  def initialize
    @hanger = []
  end

  def land(plane)
    @hanger << plane
  end
end
