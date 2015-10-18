require_relative 'plane'

class Airport

  attr_reader :plane

  def initialize

  end

  def instruct_to_land(plane)
    raise "The airport is full" if @plane
    raise "Weather is too stormy to land" if stormy?
    @plane = plane
  end

  def instruct_to_take_off(plane)
    raise "Weather is too stormy to take off" if stormy?
    plane
  end

  def report_stormy
    @stormy = true
  end

  def stormy?
    @stormy
  end

end
