require_relative 'weather'
require_relative 'plane'

class Airport
  attr_writer :capacity
  attr_reader :plane
  attr_reader :landed

  DEFAULT_CAPACITY = 5

  def full?
    planes_count >= @capacity
  end

  def planes_count
    plane.runway.count
  end

  def ok
    puts 'Ok to land'
    runway << @plane
    plane.landed
  end

  def runway
    @runway ||= []
  end

  def no_clearance
    puts 'Sorry, airport is full.' if full?
    puts 'Sorry, The weather is too stormy.' if weather_condition == false
  end
end
