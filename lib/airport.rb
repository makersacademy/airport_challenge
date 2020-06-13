class Airport
  attr_accessor :docking_bay

  def initialize(capacity = 1)
    @capacity = capacity
    @docking_bay = []
  end

  def dock(plane)
    @plane = plane
    return fail "Airport at full capacity" if @docking_bay.length >= @capacity
    self.docking_bay << @plane
  end

end
