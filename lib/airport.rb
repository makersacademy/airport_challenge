require_relative 'plane'

class Airport

attr_reader :plane

  def initialize
    @capacity = []
  end

  def land(plane)
    @plane = plane
    @capacity << @plane
  end

  def take_off(plane)
    @plane = plane
    if @capacity.empty?
      raise RuntimeError.new("There is no plane in the airport")
    else @capacity.delete(@plane)
    end
  end

end
