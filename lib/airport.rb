require_relative 'planehangar.rb'
require_relative 'aircontroller.rb'
require_relative 'plane.rb'

class Airport
  include PlaneHangar
  include AirController

  def initialize(capacity = PlaneHangar::DEFAULT_CAPACITY)
    self.capacity = capacity
    self.planes
  end

end
