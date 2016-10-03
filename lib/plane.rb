# contains plane class

class Plane

  @plane_inventory = 0
  class << self
    attr_accessor :plane_inventory
  end
  attr_reader :plane_id
#creates a unique plane id for every instance.
  def initialize
    @plane_id = self.class.plane_inventory + 1
    self.class.plane_inventory  += 1
  end
end
