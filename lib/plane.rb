require_relative 'airport'
require_relative 'air_traffic_controller'

class Plane

  attr_reader :landed
  attr_accessor :landing, :taking_off

  def initialize
    @landing = false
    @landed = false
    @taking_off = false
  end

  def clear_for_take_off?
    true
  end

  def take_off
    true
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
