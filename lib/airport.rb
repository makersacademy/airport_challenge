

# SPP: understands how to land and take off aircraft


class Airport

require_relative "weather"
require_relative "plane"

DEFAULT_CAPACITY = 20

def initialize(options={}, weather = Weather.new)
  @capacity = options[:capacity] || DEFAULT_CAPACITY
  @weather = weather
  @hanger = []
end

private

def is_full?
  hanger.size == capacity
end

def check_air_space_for(aircraft)
  fail "The plane is not flying" unless aircraft.flying?
end

def check_hanger_for(aircraft)
  fail "The plane is not here" unless hanger.include(aircraft)
end

def check_capacity
  fail "There's no space to land here." if self.is_full?
end

def check_weather
   fail "It's too stormy to fly" if weather.stormy?
end


end
