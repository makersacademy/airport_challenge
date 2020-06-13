require './lib/airport'
require './lib/weather'
require './lib/take_off'
require './lib/land'

class Plane
  attr_reader :location
  include TakeOff, Land

  def initialize
    @location = nil
  end

end
