require_relative "plane"
require_relative "weather"

class Airport
  include Weather
  attr_accessor :capacity, :hangar

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end
end
