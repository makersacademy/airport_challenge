require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 20

attr_accessor :capacity, :planes

def initialize(capacity)
  @planes = []
  @capacity = capacity
end

def confirm_landing(plane)
fail 'Stormy weather, cannot land' if stormy_weather?
fail 'Cannot land, airport full' if airport_full?
planes << plane
end

def confirm_takeoff
  fail 'Stormy weather, cannot takeoff' if stormy_weather?
  planes.pop
end

def stormy_weather?
weather = Weather.new
weather.stormy?
end

private

    attr_reader :planes

    def airport_full?
      planes.count >= capacity
    end

end
