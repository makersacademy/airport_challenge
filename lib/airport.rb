require_relative 'weather'


class Airport
  DEFAULT_CAPACITY = 10

  attr_accessor :planes_in_airport
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)

    @planes_in_airport = []
    @capacity = capacity
    @weather = Weather.new

  end


  def airport_full?
    true if @planes_in_airport.size >= @capacity
  end

end
