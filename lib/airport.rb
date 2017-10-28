require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :plane

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = plane
    @capacity = capacity
    @terminal = []
  end

  def land(plane,weather)
    raise "Airport is full" if full?
      if weather.clear?
        if plane.land?
          @terminal << plane
          true
        end
      else
        "Got a storm front coming, cannot land here"
      end
  end

  def take_off(plane, weather)
    if weather.clear?
      if plane.take_off?
        @terminal.delete(plane)
      end
        true
    else
      "The skies are dark, best to stay on the ground"
    end
  end

  private

  def full?
    @capacity.nil? ? @terminal.length >= DEFAULT_CAPACITY : @terminal.length >= @capacity
  end

end
