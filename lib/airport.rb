class Airport
  def initialize
    @planes = []
  end

  def land(p)
    fail 'Airport full' if @planes.length > 10
    @planes << p
  end

  def take_off
    fail "It's stormy!" if stormy?

    @planes = []
  end

  def planes
    @planes
  end

  def stormy?
    rand > 0.5
  end
end
