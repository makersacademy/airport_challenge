require_relative 'plane'

class Airport
  attr_accessor :plane
  alias_method :acknowledge, :plane=
  alias_method :land, :plane

  def land
    fail 'Plane already landed.' unless @plane
    @plane
  end
end
