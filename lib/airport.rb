class Airport
  attr_accessor :store_planes

  def initialize
    @store_planes = []


def land(plane)
  @store_planes << plane
end

def take_off(plane)
 !plane
end

end
