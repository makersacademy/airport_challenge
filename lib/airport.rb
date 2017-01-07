require_relative 'air_traffic_controller'
require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

end
