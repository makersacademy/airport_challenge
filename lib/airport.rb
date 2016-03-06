class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def accept(plane)
    fail "This plane is not currently flying." if plane.landed?
    plane.land
    planes << plane
  end

  def depart(plane)
    fail "This plane is not at this airport." unless planes.include? plane
    fail "This plane cannot depart due to adverse weather conditions" if Weather.new.stormy?
    plane.depart
    planes.delete(plane)
  end

  def present?(plane)
    planes.include? plane
  end

end
