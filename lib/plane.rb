require_relative 'airport'
require_relative 'air_traffic_controller'

class Plane

  attr_reader :landed, :taken_off
  attr_accessor :landing, :taking_off

  def initialize
    @landing = false
    @landed = false
    @taking_off = false
  end

  def clear_for_take_off?
    self.take_off if @taking_off
  end

  def take_off
    @taken_off = true
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
