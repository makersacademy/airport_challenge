class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land (plane)
    planes << plane
    plane
  end

  def take_off (plane)
    #throw "Planes aren't allowed to take off during stormy weather" unless weather.forecast?
    planes.delete(plane)
  end



end
