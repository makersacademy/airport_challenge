require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :capacity, :storm
  attr_reader :apron
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @apron = []
    @storm = Weather.new.stormy?
  end

  def land(plane)
    land_error(plane)
    plane.landing
    @apron << plane
  end

  def takeoff(plane)
    takeoff_error(plane)
    plane.taking_off
    @apron.delete(plane)
  end

  private

  def full?
    @apron.size >= DEFAULT_CAPACITY
  end

  def parked?(plane)
    @apron.include?(plane)
  end

  def storm?
    @storm
  end

  def landed?(plane)
    plane.landed?
  end

  def land_error(plane)
    raise 'The storm prevent the landing!' if storm?
    raise 'The airport is full!' if full?
    raise 'This plane is currently landed!' if landed?(plane)
  end

  def takeoff_error(plane)
    raise 'This plane is not in the apron!' unless parked?(plane)
    raise 'The storm prevent the takeoff!' if storm?
  end
end
