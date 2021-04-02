require_relative 'plane'

class Airport
  attr_reader :plane
  def dock(plane)
    @plane = plane
  end
end
