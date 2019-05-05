class Airport
  attr_accessor :planes

  def initialize
    @planes = 0
  end

  def land_plane
    # change this to just be an accumulator, to adhere to
    # encapsulation by not repeating data
    self.planes += 1
  end

  def takeoff_plane
    self.planes -= 1
  end
end
