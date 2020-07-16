

class Airport

DEFAULT_CAPACITY = 10

attr_reader :planes
attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
end



  # def land_plane
  # end
  #
  # def takeoff_plane
  # end
