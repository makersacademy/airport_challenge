class Airport
  attr_accessor :plane

  def initialize
    @plane = Plane.new
  end

  def land(plane)
    @plane = plane
  end

  def take_off
    if @plane.nil?
      return nil
    else
      @plane = nil
    end
  end

end
