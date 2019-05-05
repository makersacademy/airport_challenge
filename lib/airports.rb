require_relative './planes.rb'
require_relative './weather.rb'

class Airport
  attr_accessor :planes
  attr_reader :capacity, :weather

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def at_capacity?
    @planes.size >= @capacity
  end
end
