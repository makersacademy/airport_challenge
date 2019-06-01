require_relative "weather"

class Airport
  attr_accessor :contents

  def initialize
    @contents = []
  end

  def land(plane)
    @contents << plane
  end

  def take_off(plane,weather)
    raise "Weather preventing takeoff" if weather.stormy?
    @contents.delete(plane)
    "Take off complete"
  end





end
