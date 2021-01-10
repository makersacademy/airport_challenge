require './lib/airport'

class Plane

  ##  Plane keeps track of whether a plane is flying or on the runway

  attr_reader :flying

  def initialize
    @flying = false
  end

  def landed
    @flying = false
  end

  def in_air
    @flying = true
  end

  # def on_runway?
  #   @on_runway
  # end

  def flying?
    @flying
  end

end
