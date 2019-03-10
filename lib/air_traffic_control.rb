# code

require_relative 'plane'

class Control

  attr_reader :capcity, :stormy_weather

  def initialize
    @capacity = []
    @stormy_weather = false
  end

  def land(plane)
    @capacity.push(plane)
  end

  def takeoff(plane)

    if @capacity.empty? && @stormy_weather == false
      puts "No planes available"
      @capacity.to_a
    elsif !@capacity.empty? && @stormy_weather == false
      @capacity.delete(plane)
      @capcity.to_a
    else
      puts "No take off while weather stormy"
      @capacity.to_a
   end
  end

  def stormy?(plane)
    @stormy_weather = true
  end

  def storm_passed(plane)
    @stormy_weather = false
  end

end
