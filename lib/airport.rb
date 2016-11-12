require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes, :stormy, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @stormy = false
    @capacity = capacity
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
    @planes.count >= DEFAULT_CAPACITY
  end


end
