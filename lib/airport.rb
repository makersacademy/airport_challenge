require 'plane'


class Airport
  attr_accessor :run_way
  def initialize
    @run_way
  end
def land(plane)
  @run_way = plane
end
end
