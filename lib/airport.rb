require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :apron, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @apron = []
    @capacity = capacity
  end

  def confirm_landing(weather, plane)
    raise "too stormy to land" if conditions(weather)
    raise "airport full" if full?
    unless @apron.include?(plane)
      if plane.flight == true
        plane.landed
        @apron << plane
      end
    end
    @apron

  end

  def confirm_takeoff(weather)
    raise "too stormy to take off" if conditions(weather)
    @apron.pop.takeoff
    @apron
  end

private

  def full?
    apron.count >= @capacity
  end

  def conditions(weather)
    weather.condition < 60
  end

end
