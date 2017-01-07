require_relative 'airport'
require_relative 'air_traffic_controller'

class Plane

  attr_reader :landed
  attr_accessor :landing

  def initialize
    @landing = false
    @landed = false
  end

  def clear_to_land?
    self.land if @landing
  end

  def land
    @landed = true
  end

  def landed?
    @landed
  end

end
