require_relative 'plane'

class Airport
  attr_reader :plane

  def instruct_landing(plane)
    raise "CANNOT LAND: AIRPORT AT FULL CAPACITY!" if @plane
    @plane = plane
  end

  def instruct_take_off
    @plane
  end

end
