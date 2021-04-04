require_relative 'plane'

class Airport
  attr_reader :hanger, :capacity
  DEFAULT_CAPACITY = 1


  def initialize(capcity = DEFAULT_CAPACITY, capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    raise 'unable to land plane, hanger is full' if hanger_full?
    @hanger << plane
  end

  def take_off(plane)
    raise 'unable to take_off, no planes at hanger' if hanger_is_empty?
    @hanger.delete(plane)
  end

  def hanger_is_empty?
    @hanger.empty?
  end

  def hanger_full?
    @hanger.count >= @capacity
  end


end
