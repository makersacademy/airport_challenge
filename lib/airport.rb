class Airport
  attr_accessor :stormy
  def initialize
    @stormy = false
  end

  def stormy?
    @stormy
  end

  def land(plane)
    fail "The plane can't be landed - it is stormy" if @stormy == true
  end

  def take_off(plane)
    fail "The plane can't take off - it is stormy" if @stormy == true
  end

end
