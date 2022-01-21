class Airport
  def initialize(capacity=5)
    @capacity = capacity
  end

  def land(plane)
    raise if @capacity.zero?
    "Plane landed at airport"
  end

  def take_off(plane)
    "Plane has taken off"
  end
end
