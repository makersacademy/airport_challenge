require_relative 'plane'
class Airport

  attr_reader :plane, :capacity

  def initialize
    @plane = []
    @capacity = 5
  end

  def weather_reporter(rand)
    if rand >= 3
      p "Sunny"
    else
      p "Stormy"
    end
  end

  def land(plane)
    weather = weather_reporter(rand(10))
    if weather == "Sunny" && @plane.count >= @capacity
      raise "This airport is full, you cannot land here"
    elsif weather == "Sunny" && @plane.count < @capacity
      @plane << plane
    else raise "The weather is too stormy, you cannot land"
    end
  end

  def take_off(plane)
    weather = weather_reporter(rand(10))
    if weather == "Sunny"
      p "The weather is sunny, safe to take off. The plane has successfully left the airport"
      @plane.pop
    else
      raise "The weather is too stormy, you cannot take off"
    end
  end

  def change_capacity
    p "What number would you like to set this airport's capacity to?"
    p "Press enter to skip and use default capacity of 5"
    @capacity = gets.chomp.to_i
    if @capacity.zero?
      @capacity = 5
    else
      p @capacity
    end
  end

end
