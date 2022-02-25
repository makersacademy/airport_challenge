class Airport
  def initialize(capacity = 10)
    @capacity = capacity
    @planes = []
  end

  def report_capacity
    return @capacity
  end

  def list_planes
    @planes
  end
end