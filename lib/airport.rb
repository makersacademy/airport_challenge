require_relative 'weather'
require_relative 'plane'

class Airport
  attr_reader :hangar, :hangar_capacity, :weather
  DEFAULT_CAPACITY = 5
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @hangar_capacity = capacity
    @weather = Weather.new.weather
  end
end
