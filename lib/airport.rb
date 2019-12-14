require_relative 'plane'

class Airport
  attr_accessor :capacity
  attr_reader :apron
  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @apron = []
  end

  def land(plane)
    raise 'The airport is full!' if full?
    @apron << plane
  end

  def takeoff(plane)
    raise 'This plane is not in the apron!' unless landed?(plane)
    @apron.delete(plane)
  end

  private

  def full?
    @apron.size >= DEFAULT_CAPACITY
  end

  def landed?(plane)
    @apron.include?(plane)
  end
end
