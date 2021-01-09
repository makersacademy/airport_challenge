require './lib/airport'

class Plane

  ##  Plane keeps track of whether a plane is flying or on the runway

  attr_reader :on_runway
  attr_reader :flying

  def initialize
    @on_runway = true
    @flying = false
  end

  def landed
    @on_runway = true
    @flying = false
  end

  def in_air
    @on_runway = false
    @flying = true
  end

  def on_runway?
    @on_runway
  end

  def flying?
    @flying
  end

end
