require_relative 'planehanger.rb'
require_relative 'plane.rb'

class Airport
  include PlaneHangar

  def initialize(capacity = PlaneHangar::DEFAULT_CAPACITY)
    self.capacity = capacity
    self.planes
  end

end
