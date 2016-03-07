class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def set_capacity=(capacity)
    @capacity = capacity
  end

  def accept(plane)
    fail "This plane is not currently flying." if plane.landed?
    fail "This plane cannot land due to adverse weather conditions" if is_stormy?
    fail "This airport is currently at capcity." if at_capacity?
    plane.land
    planes << plane
  end

  def depart(plane)
    fail "This plane is not at this airport." unless planes.include? plane
    fail "This plane cannot depart due to adverse weather conditions" if is_stormy?
    plane.depart
    planes.delete(plane)
  end

  def present?(plane)
    planes.include? plane
  end

  def is_stormy?
    Weather.new.stormy?
  end

  def at_capacity?
    self.planes.count == @capacity
  end

end
