class Airport
  attr_reader :plane
  def land(plane)
    fail "plane already landed" if @plane == plane
    fail "can't land, airport full" unless @plane.nil?
    @plane = plane
  end
end
