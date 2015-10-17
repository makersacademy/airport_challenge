require_relative 'plane'

class Airport
  attr_reader :plane

  def land_plane plane
    raise 'The airport is full'
    @plane = plane
  end

  def take_off
    # @plane = @plane - 1
  end

end
