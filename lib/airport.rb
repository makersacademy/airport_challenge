class Airport
  attr_accessor :plane

  def initialize
    @plane = Plane.new
  end

  def land(plane)
    @plane = plane
  end

  def take_off
    if @plane.empty?
      fail "No planes avaliable for take off."
    else
      @plane
    end
  end

end
