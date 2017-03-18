class Airport

  def initialize
    @landing_strip = []
  end

  def land(plane)
    @landing_strip << plane
  end

  private
  attr_reader :landing_strip
end
