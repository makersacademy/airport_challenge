require_relative 'plane'

class Airport
  attr_reader :plane

  def land_plane plane
    fail "The airport is full"
    @stormy == true ? 'Cannot land plane' : @plane = plane
  end

  def take_off
    # @plane = @plane - 1
    @stormy == true ? 'Cannot land plane' : 'You are able to land plane'
  end

  def stormy
    @stormy = true
  end

end
