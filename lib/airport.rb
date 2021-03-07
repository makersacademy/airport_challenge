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
    if !plane.flying?
      "Plane has already landed at #{here?(plane) ? "this" : "another"} airport."
    elsif full?
      "Plane cannot land, Airport is full."
    elsif stormy?
      "Plane cannot land, it is stormy. Plane to circle."
    else
      land_plane(plane)
      "Plane has landed."
    end
  end

  def request_to_take_off(plane)
    if empty?
      "No planes to take off. Have a 5 minute break air control..."
    elsif !here?(plane)
      "That plane is not at the airport, cannot take off."
    elsif stormy?
      "Plane cannot take off, it is stormy. Each passenger gets a £15 WcDonalds Voucher."
    else
      take_off_plane(plane)
      "Plane has taken off."
    end
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
    plane.land(self)
  end

  def take_off_plane(plane)
    @planes.delete(plane)
    plane.take_off
  end

  def here?(plane)
    @planes.include?(plane)
  end
end
