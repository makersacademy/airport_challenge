require "./lib/airport.rb"

class Airplane
  attr_accessor :flying

  def initialize
    @flying = true
  end

  def landed
    @flying = false
  end

  def taken_off
    @flying = true
  end
end
