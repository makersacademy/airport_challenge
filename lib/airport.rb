class Airport

  attr_reader :landing_strip, :capacity

  def initialize
    @landing_strip = []
    @capacity = 10
  end

  def land(plane)
    fail 'Landing not allowed' if full?
    landing_strip << plane
  end

  def take_off
    @plane = plane
  end


private

  def full?
    landing_strip.count >= capacity
  end

  def empty?
    landing_strip.empty?
  end


end
