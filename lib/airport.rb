require_relative 'plane'

class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "The airport is full!" if full?
    @planes << plane
  end

  def take_off
    "This plane is no longer in the airport!" if true
  end

  private

  def full?
    @planes.length >= 20
  end
end