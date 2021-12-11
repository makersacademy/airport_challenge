require_relative 'plane'

class Airport
  def initialize
    @planes = []
  end

  def instruct_landing(plane)
    raise "CANNOT LAND: AIRPORT AT FULL CAPACITY!" if @planes.size >= 10
    @planes << plane
  end

  def instruct_take_off
    @planes.pop
  end

end

