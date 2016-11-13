require_relative "airport.rb"

class Airplane

  attr_accessor :landed
  attr_accessor :taken_off

  def initialize
    @landed = true
    @taken_off = true
  end

  def land(airport)
    @landed = true
  end

  def take_off(airport)
    @landed = false
  end
end
