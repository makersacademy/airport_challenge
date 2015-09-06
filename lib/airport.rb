require_relative 'aircontroller'
require_relative 'planehangar'
require_relative 'plane'

class Airport
  include AirController
  include PlaneHangar

  def initialize(capacity = PlaneHangar::DEFAULT_CAPACITY)
    self.capacity = capacity
    self.planes
  end

end
