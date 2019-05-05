require_relative './planes.rb'
require_relative './weather.rb'

class Airport
  attr_accessor :planes
  attr_reader :capacity, :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def at_capacity?
    @planes.size >= capacity
  end
end
