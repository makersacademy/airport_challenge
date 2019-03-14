class Plane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def in_flight
    @flying = true
  end

  def on_tarmac
    @flying = false
  end
end
