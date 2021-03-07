# require './lib/plane.rb'
# require './lib/weather.rb'

require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  def initialize(capacity = DEFAULT_CAPACITY, name = "test_airport")
    @airport_capacity = capacity.positive? ? capacity : DEFAULT_CAPACITY
    @planes = []
    @name = name
  end

  DEFAULT_CAPACITY = 10

  include Weather

  attr_reader :airport_capacity, :planes, :name

  def request_to_land(plane)
    return "Plane is already at #{here?(plane) ? "this" : "another"} airport." unless plane.flying?
    return "Plane cannot land, Airport is full." if full?
    return "Plane cannot land, it is stormy. Plane to circle." if stormy?

    land_plane(plane)
    "Plane has landed."
  end

  def request_to_take_off(plane)
    return "No planes to take off. Have a 5 minute break air control..." if empty?
    return "That plane is not at the airport, cannot take off." unless here?(plane)
    return "Plane cannot take off, it is stormy. Everybody gets a £15 WcDonalds Voucher." if stormy?

    take_off_plane(plane)
    "Plane has taken off."
  end

  private

  def full?
    @planes.count >= @airport_capacity
  end

  def empty?
    @planes.count.zero?
  end

  def stormy?
    generate_weather == "Stormy"
  end

  def land_plane(plane)
    @planes << plane
    plane.send(:land, self)
  end

  def take_off_plane(plane)
    @planes.delete(plane)
    plane.send(:take_off)
  end

  def here?(plane)
    @planes.include?(plane)
  end
end
