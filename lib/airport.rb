class Airport
  attr_reader :landing_strip

  def initialize
    @landing_strip = []
  end

  def land(plane)
    if @landing_strip.include?(plane)
      raise "This plane has already landed"
    else
    @landing_strip << plane
    end
  end

  def take_off(plane)
    if !@landing_strip.include?(plane)
      raise "This plane is already airborne"
    else
    @landing_strip.pop
    end
  end

  private


end
