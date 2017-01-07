require_relative 'airport'
require_relative 'air_traffic_controller'
require_relative 'plane'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

end
