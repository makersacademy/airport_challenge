require_relative 'airport'
# require './lib/weather.rb'

class Plane
  attr_reader :landed, :taken_off

  def initialize(landed = false, taken_off = false)
    @landed = landed
    @taken_off = taken_off
  end

  def landed?
    @landed = true
    @taken_off = false
  end

  def taken_off?
    @landed = false
    @taken_off = true
  end

end
