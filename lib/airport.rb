require_relative 'plane'

class Airport
  attr_reader :plane, :capacity, :stormy

  def initialize(capacity=10)
    @planes = []
    @stormy = false
    @capacity = capacity
  end

  def inventory
    @planes
  end

  def land_plane plane
    fail 'The airport is full' if full?
    fail 'Is stormy so cannot land' if @stormy
    plane.land
    @planes << plane
  end

  def take_off plane
    fail 'Is stormy so cannot take off' if @stormy
    plane.take_off
    @planes.pop
  end

  def stormy
    @stormy = true
  end

  private
  def full?
    @planes.count >= @capacity
  end

end
