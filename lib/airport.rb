require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :capacity, :storm
  attr_reader :apron
  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @apron = []
    @storm = Weather.new.stormy?
  end

  def land(plane)
    raise 'The storm prevent the landing!' if storm?
    raise 'The airport is full!' if full?
    @apron << plane
  end

  def takeoff(plane)
    raise 'This plane is not in the apron!' unless landed?(plane)
    raise 'The storm prevent the takeoff!' if storm?
    @apron.delete(plane)
  end

  private

  def full?
    @apron.size >= DEFAULT_CAPACITY
  end

  def landed?(plane)
    @apron.include?(plane)
  end

  def storm?
    @storm
  end
end
