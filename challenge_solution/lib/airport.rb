# require "./lib/aeroplane"

class Airport
  attr_accessor :landed
  attr_accessor :weather
  attr_accessor :capacity

  def initialize
    @landed = []
    @weather = rand(10)
    @capacity = 2
  end

  def land(aeroplane)
    if @weather == 1 && @landed.count < @capacity
      return "Stormy conditions, #{aeroplane} cannot safely land"
    elsif @landed.count >= @capacity
      return "Airport is at max capacity"
    else
      @landed << aeroplane
    end
  end

  def takeoff(aeroplane)
    if @weather == 1
      return "Stormy conditions, #{aeroplane} cannot take off"
    else
      @landed.delete(aeroplane)
      if @landed.include?(aeroplane) == false
        aeroplane.capitalize![0]
        puts "#{aeroplane} has taken off"
      end
    end
  end
end

# airport = Airport.new
# airport.weather = 1
# puts airport.weather
# airport.land("aeroplane")
# airport.takeoff("aeroplane")
# puts airport.weather
