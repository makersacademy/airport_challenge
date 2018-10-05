require 'pry'

class Airport

  def initialize
    @planes = []
  end

  def planes
    @planes
  end

  def receive(plane)
    # raise "Airport is closed due to weather conditions" if Weather.stormy? == true
    @planes << plane
  end

  def sendoff(plane)
    # binding.pry
    raise "Airport is closed due to weather conditions" if Weather.stormy? == true
    # binding.pry
    @planes.delete(plane)
    # binding.pry
  end

end
