require_relative 'plane'

class Airport

  attr_reader :planes, :stormy

  def initialize
    @planes = []
    @stormy = false
  end

  def land(plane)
    raise "Due to inclement weather no planes can land" if @stormy
    raise "This airport is full, hope you have enough fuel!" if check_full?
    @planes << plane
    "Flight #{plane} has landed."
  end

  def take_off
    raise "Due to inclement weather no planes can take off" if @stormy
    @planes.pop
  end

  def is_it_stormy?(number)
    @stormy = number == 5? true : false
  end

  def number_generator
    rand(1..5)
  end

  def check_full?
    full?
  end

  def full?
    @planes.count >= 10
  end


end
