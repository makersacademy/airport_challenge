class Airport
  attr_reader :plane

  def land(plane)
    raise 'Cannot Land: Turbulent Weather' if Weather.current == "stormy"
    raise 'Cannot Land: Airport Full' if @plane

    @plane = plane
  end

  def take_off(_plane)
    raise 'Cannot Take Off: Turbulent Weather' if Weather.current == "stormy"

    @plane = nil
  end
end
