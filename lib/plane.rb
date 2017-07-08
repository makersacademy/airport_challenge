# require './lib/airport.rb'
# require './lib/weather.rb'

class Plane
  attr_reader :landed, :taken_off

  def initialize(landed=false, taken_off=false)
    @landed = landed
    @taken_off = taken_off
  end

  def landed?
    @landed = true
  end

  def departed?
    @landed = false
    @taken_off = true
  end

end
