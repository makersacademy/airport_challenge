require_relative 'plane'

class Airport

attr_reader :holding_bay

  def initialize
    @holding_bay = []
  end

  def land(plane)
    plane.change_status
    @holding_bay << plane
  end

  def take_off
    @holding_bay.last
  end

#   def setup_holding_bay(capacity)
#     @holding_bay =
#   end

end
