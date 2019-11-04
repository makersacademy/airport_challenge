

class Airport

DEFAULT_CAPACITY = 10

attr_reader :airplanes
attr_accessor :capacity 

  def initialize(capacity = DEFAULT_CAPACITY)
    @airplanes = []
    @capacity = capacity
  end
end



  # def land_plane
  # end
  #
  # def takeoff_plane
  # end
