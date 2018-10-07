require_relative 'plane.rb'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :airport
  attr_reader :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @airport = []
  end

  def take_off
    raise "No planes available" if empty?
    @airport.each do |plane|
      if plane.good_weather?
        return plane
        break
      end
    end
  end

  def land_plane(plane, good_weather = true)
    raise "Airport full" if full?
    plane.report_bad_weather if good_weather == false
    @airport.push(plane)
    "Plane has landed"
  end

  private

  def full?
    @airport.count >= DEFAULT_CAPACITY
  end

  def empty?
    @airport.empty?
  end
end
