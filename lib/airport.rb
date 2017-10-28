class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    if @planes.include?(plane)
      @planes.delete(plane)
    else
      fail "plane not in airport"
    end
  end

end
