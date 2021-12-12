#Airport class
class Airport
  attr_reader :planes
  def initialize
    #create a planes array
    @planes = []
  end
  def land(plane)
    #and plane will be pushed to planes array
    @planes << plane
  end
  def take_off(plane)
    @planes.delete(plane)
  end
end
