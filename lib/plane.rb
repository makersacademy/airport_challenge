require_relative 'airport'
require_relative 'weather'

class Plane
  attr_reader :landed

  def initialize
    @landed = false
  end

  def land
    fail 'Plane is not in flight' if landed == true
    weather = Weather.new
    fail 'Too stormy to land' if weather.stormy? == true
    @landed = true
  end

  def take_off
    fail 'Plane is already in flight' if landed == false
    weather = Weather.new
    fail 'Too stormy to take off' if weather.stormy? == true
    @landed = false
  end

end
