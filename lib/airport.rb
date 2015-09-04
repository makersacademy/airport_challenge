require_relative 'aircontroller.rb'
require_relative 'plane.rb'

class Airport
  include AirController

  def initialize(capacity = AirController::DEFAULT_CAPACITY)
    self.capacity = capacity
    self.planes
  end

end
