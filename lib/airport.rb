require 'plane'

class Airport
  attr_accessor :aerodrome

  def initialize
    @aerodrome = []
  end

  def receive(plane)
    @aerodrome << plane
  end

  def release(plane)
    @aerodrome.delete(plane)
  end
end
