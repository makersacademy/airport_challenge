require 'plane'
require 'weather'

class Airport
  attr_reader :capacity
  attr_reader :landing_strip

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @landing_strip = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    # fail 'Cannot land as it is too stormy' if @weather.stormy?
    fail 'Cannot land as landing strip is full' if full?
    fail 'This plane is not flying' if plane.flying? == false
    @landing_strip.push(plane)
    plane.lands
  end

  def take_off
    # fail 'Cannot land as it is too stormy' if @weather.stormy?
    fail 'Cannot take off as there aren\'t any planes!' if empty?
    #run takes off method in plane
    @landing_strip.pop.takes_off
  end

  private

  def full?
    landing_strip.count >= capacity
  end

  def empty?
    landing_strip.empty?
  end
end
