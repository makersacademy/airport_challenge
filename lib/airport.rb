require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @stormy = false
  end

  def land(plane)
    @planes << plane
    "Flight #{plane} has landed."
  end

  def take_off
    raise "Due to inclement weather no planes can take off" if @stormy
    @planes.pop
  end

  def is_it_stormy?(number)
    @stormy = number > 4? true : false
  end

  def number_generator
    rand(1..5)
  end

end
