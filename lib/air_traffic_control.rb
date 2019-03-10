# code

require_relative 'plane'

class Control

  attr_reader :capacity, :stormy_weather, :planes

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @stormy_weather = false
  end

  def land(plane)
    fail 'Capacity full' if full?

    @planes.push(plane)
  end

  def takeoff(plane)

    if @planes.empty? && @stormy_weather == false
      puts "No planes available"
    elsif !@planes.empty? && @stormy_weather == false
      @planes.delete(plane)
    else
      puts "No take off while weather stormy"
    end

    @planes.to_a
  end

  def stormy?(plane)
    @stormy_weather = true
  end

  def storm_passed(plane)
    @stormy_weather = false
  end

  private

  def full?
    @planes.length == @capacity
  end
end
