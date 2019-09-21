require_relative 'airport'

class Plane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def land(airport)
    raise 'plane already grounded' unless flying?

    @flying = false
    "plane landed safely at #{airport.name}"
  end

  private

  def flying?
    @flying
  end

end
