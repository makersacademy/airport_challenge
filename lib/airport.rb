# require './lib/plane.rb'
# require './lib/weather.rb'

require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_capacity = capacity
    @planes = []
  end

  DEFAULT_CAPACITY = 10

  include Weather

  attr_reader :airport_capacity

  def request_to_land(plane)
    if full?
      "Plane cannot land, Airport is full."
    else
      @planes << plane
      "Plane has landed."
    end
  end

  def request_to_take_off(_plane)
    if stormy?
      "Plane cannot take off, it is stormy. Each passenger gets a £15 WcDonalds Voucher."
    else
      "Plane has taken off."
    end
  end

  private

  def full?
    @planes.count >= @airport_capacity
  end

  def stormy?
    generate_weather == "Stormy"
  end
end

#
# x = Airport.new
# puts x.request_to_land("plane")
